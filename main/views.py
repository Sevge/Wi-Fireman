from django.shortcuts import render
from . import models

# Create your views here.

from django.shortcuts import render, redirect
from django.conf import settings
from . import models, forms
import hashlib
import datetime

# Create your views here.


def hash_code(s, salt='mysite'):
    h = hashlib.sha256()
    s += salt
    h.update(s.encode())
    return h.hexdigest()


def make_confirm_string(user):
    now = datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    code = hash_code(user.name, now)
    models.ConfirmString.objects.create(code=code, user=user,)
    return code


def send_email(email, code):
    from django.core.mail import EmailMultiAlternatives
    subject = '来自 WiFiremen 的注册确认邮件'
    text_content = '''感谢注册 WiFiremen, 
    恭喜您已注册成功!
    现在访问 http://127.0.0.1 体验吧!'''
    html_content = '''
    <p>感谢注册<a href="http://{}/confirm/?code={}" target=blank>WiFiremen</a>，</p>
                    <p>请点击站点链接完成注册确认！</p>
                    <p>此链接有效期为{}天！</p>
    '''.format('127.0.0.1:8000', code, settings.CONFIRM_DAYS)
    msg = EmailMultiAlternatives(subject, text_content, settings.EMAIL_HOST_USER, [email])
    msg.attach_alternative(html_content, "text/html")
    msg.send()


def index(request):
    if not request.session.get('is_login', None):
        return redirect('/login/')
    return render(request, 'main/index.html')


def login(request):
    if request.session.get('is_login', None):
        return redirect('/index/')
    if request.method == 'POST':
        login_form = forms.UserForm(request.POST)
        message = '请检查填写的内容!'
        if login_form.is_valid():
            username = login_form.cleaned_data.get('username')
            password = login_form.cleaned_data.get('password')
            try:
                user = models.User.objects.get(name=username)
            except:
                message = '用户不存在!'
                return render(request, 'main/login.html', locals())
            if not user.has_confirmed:
                message = '该用户还没有讲过邮件确认!'
                return render(request, 'main/login.html', locals())
            if user.password == hash_code(password):
                request.session['is_login'] = True
                request.session['user_id'] = user.id
                request.session['user_name'] = user.name
                return redirect('/index/')
            else:
                message = '密码不正确!'
                return render(request, 'main/login.html', locals())
        else:
            return render(request, 'main/login.html', locals())
    login_form = forms.UserForm()
    return render(request, 'main/login.html', locals())


def register(request):
    if request.session.get('is_login', None):
        return redirect('/index')
    if request.method == 'POST':
        register_form = forms.RegisterForm(request.POST)
        message = '请检查填写的内容'
        if register_form.is_valid():
            username = register_form.cleaned_data.get('username')
            password1 = register_form.cleaned_data.get('password1')
            password2 = register_form.cleaned_data.get('password2')
            email = register_form.cleaned_data.get('email')
            if password1 != password2:
                message = '两次输入的密码不同!'
                return render(request, 'main/register.html', locals())
            else:
                same_name_user = models.User.objects.filter(name=username)
                if same_name_user:
                    message = '用户已经存在!'
                    return render(request, 'main/register.html', locals())
                same_email_user = models.User.objects.filter(email=email)
                if same_email_user:
                    message = '该邮箱已经被注册!'
                    return render(request, 'main/register.html', locals())

                new_user = models.User()
                new_user.name = username
                new_user.password = hash_code(password1)
                new_user.email = email
                new_user.save()
                code = make_confirm_string(new_user)
                send_email(email, code)

                message = '请前往邮箱进行确认!'
                return render(request, 'main/register.html', locals())
        else:
            return render(request, 'main/register.html', locals())
    register_form = forms.RegisterForm()
    return render(request, 'main/register.html', locals())


def logout(request):
    if not request.session.get('is_login', None):
        return redirect("/login/")
    request.session.flush()
    return redirect('/login/')


def user_confirm(request):
    code = request.GET.get('code', None)
    message = ''
    try:
        confirm = models.ConfirmString.objects.get(code=code)
    except:
        message = '无效的确认请求!'
        return render(request, 'main/confirm.html', locals())
    c_time = confirm.c_time
    now = datetime.datetime.now()
    if now > c_time + datetime.timedelta(settings.CONFIRM_DAYS):
        confirm.user.delete()
        message = '您的邮件已经过期!请重新注册!'
        return render(request, 'main/confirm.html', locals())
    else:
        confirm.user.has_confirmed = True
        confirm.user.save()
        confirm.delete()
        message = '感谢确认,请使用您的账户登录!'
        points = models.Point.objects.all()
        return render(request, 'main/bind_network.html', {'user': confirm.user, 'points': points})


def bind_network(request):
    if request.method == 'POST':
        selected_point = request.POST.get('selected_point')
        point = models.Point.objects.get(id=selected_point)
        name = request.path.split('/')[2]
        print(name)
        user = models.User.objects.filter(name=name).first()

        print(selected_point)
        user.point = point
        user.save()
        message = '''
        完成!
        正在初始化......
        稍后请重新登录系统!'''
        return render(request, 'main/confirm.html', locals())


def profile(request):
    all_points = models.Point.objects.all()
    user = models.User.objects.get(id=request.session.get('user_id'))
    user = models.User.objects.get(id=request.session.get('user_id'))
    if request.method == 'POST':
        old_pass = request.POST.get('password1')
        new_pass = request.POST.get('password2')
        if hash_code(old_pass) != user.password:
            msg = '您输入的原始密码不正确!'
            return render(request, 'main/profile.html', {'msg': msg, 'points': all_points, 'now_point': user.point})
        elif not new_pass:
            bind_point = request.POST.get('selected_point')
            point = models.Point.objects.get(id=bind_point)
            user.point = point
            user.save()
            msg = '您的信息已修改成功!'
            return render(request, 'main/profile.html', {'msg': msg, 'points': all_points, 'now_point': user.point})
        else:
            bind_point = request.POST.get('selected_point')
            point = models.Point.objects.get(id=bind_point)
            user.point = point
            user.password = hash_code(new_pass)
            user.save()
            msg = '您的信息已修改成功!'
            return render(request, 'main/profile.html', {'msg': msg, 'points': all_points, 'now_point': user.point})
    return render(request, 'main/profile.html', {'points': all_points, 'now_point': user.point})


def log(request):
    logs = models.Log.objects.all().order_by('-c_time')
    return render(request, 'main/log.html', {'logs': logs})


def dashboard(request):
    all_points = models.Point.objects.all().order_by('-quality')
    print(request.session.get('user_id'))
    user = models.User.objects.get(id=request.session.get('user_id'))
    my_point = user.point
    devices = my_point.device_set.all()
    return render(request, 'main/dashboard.html', {'points': all_points, 'my_point': my_point, 'devices': devices})
