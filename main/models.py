from django.db import models
from django.core.validators import MaxValueValidator, MinValueValidator


class User(models.Model):
    name = models.CharField(max_length=128, unique=True)
    password = models.CharField(max_length=256)
    email = models.EmailField(unique=True)
    c_time = models.DateTimeField(auto_now_add=True)
    has_confirmed = models.BooleanField(default=False)
    point = models.OneToOneField('Point', on_delete=models.CASCADE, blank=True, null=True)

    def __str__(self):
        return self.name

    class Meta:
        ordering = ["-c_time"]
        verbose_name = "用户"
        verbose_name_plural = "用户"


class ConfirmString(models.Model):
    code = models.CharField(max_length=256)
    user = models.OneToOneField('User', on_delete=models.CASCADE)
    c_time = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.user.name + ': ' + self.code

    class Meta:
        ordering = ['-c_time']
        verbose_name = '确认码'
        verbose_name_plural = '确认码'


class Point(models.Model):
    ssid = models.CharField(max_length=128)
    mac = models.CharField(max_length=128)
    quality = models.IntegerField( default=1, validators=[MaxValueValidator(100), MinValueValidator(1)])

    def __str__(self):
        return self.ssid

    class Meta:
        ordering = ["ssid"]
        verbose_name = "热点"
        verbose_name_plural = "热点"


class Device(models.Model):
    name = models.CharField(max_length=128)
    mac = models.CharField(max_length=128)
    point = models.ForeignKey(to='Point', on_delete=models.CASCADE)

    def __str__(self):
        return self.name

    class Meta:
        ordering = ["name"]
        verbose_name = "设备"
        verbose_name_plural = "设备"


class Deauth(models.Model):
    count = models.IntegerField()
    c_time = models.DateTimeField(auto_now_add=True)
    point = models.ForeignKey(to='Point', on_delete=models.CASCADE)

    def __str__(self):
        return '{}-deauth:{}'.format(self.point.ssid, self.count)

    class Meta:
        ordering = ["-c_time"]
        verbose_name = "deauth帧"
        verbose_name_plural = "deauth帧"


class Beacon(models.Model):
    count = models.IntegerField()
    c_time = models.DateTimeField(auto_now_add=True)
    point = models.ForeignKey(to='Point', on_delete=models.CASCADE)

    def __str__(self):
        return '{}-beacon:{}'.format(self.point.ssid, self.count)

    class Meta:
        ordering = ["-c_time"]
        verbose_name = "beacon帧"
        verbose_name_plural = "beacon帧"


class Log(models.Model):
    l = (
        (0, 'Info'),
        (1, 'Warn'),
        (2, 'Critical')
    )
    msg = models.CharField(max_length=256)
    level = models.IntegerField(choices=l, default=0)
    c_time = models.DateTimeField(auto_now_add=True)
    point = models.ForeignKey(to='Point', on_delete=models.CASCADE)

    def __str__(self):
        return self.msg

    class Meta:
        ordering = ["-c_time"]
        verbose_name = "记录"
        verbose_name_plural = "记录"