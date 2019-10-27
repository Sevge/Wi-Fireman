from django.contrib import admin
from . import models

# Register your models here.

admin.site.register(models.User)
admin.site.register(models.Point)
admin.site.register(models.Deauth)
admin.site.register(models.Beacon)
admin.site.register(models.Device)
admin.site.register(models.Log)