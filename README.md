# Wi-Fireman 无线网络异常行为监控系统
- Demo: http://47.106.66.106(wangtao,123123)
## 环境要求
- MySQL 5.7
- Python 3.6

## 安装
- 使用pip安装：
`pip install -Ur requirements.txt`
如果你没有pip，使用如下方式安装：
- OS X / Linux 电脑，终端下执行:
```
curl http://peak.telecommunity.com/dist/ez_setup.py | python
curl https://raw.github.com/pypa/pip/master/contrib/get-pip.py | python
```
- windows电脑：
```
下载?http://peak.telecommunity.com/dist/ez_setup.py?和?https://raw.github.com/pypa/pip/master/contrib/get-pip.py?这两个文件，双击运行。
```

## 运行
- 修改DjangoBlog/setting.py?修改数据库配置，如下所示：
```
DATABASES = {
    'default': {
            'ENGINE': 'django.db.backends.mysql',
            'NAME': 'wifiremen',
            'HOST': '127.0.0.1',
            'PORT':3306,
            'USER': 'root',
            'PASSWORD': '',
    }
}
```

## 创建数据库
- mysql数据库中执行:
CREATE DATABASE `wifiremen`                                                         
然后终端下执行:
```
./manage.py makemigrations
./manage.py migrate
```
## 创建超级用户
- 终端下执行:
`./manage.py createsuperuser`
## 导入数据
终端下执行: ?
```
mysql -uroot -p
mysql > use wifiremen
Mysql > source d:/wifiremen/wifiremen.sql (修改sql文件对应目录)
```
# 开始运行：
执行：?./manage.py runserver
浏览器打开:?http://127.0.0.1:8000/? 就可以看到页面了。
初始用户名与密码是：
- wangtao，123123

