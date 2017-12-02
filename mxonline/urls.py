"""mxonline URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
from django.views.generic import TemplateView  # 拉起静态页面
# from django.contrib import admin
from django.views.static import serve

import xadmin

from users.views import LoginView, LogoutView, RegisterView, ActivateUserView, ForgetPwdView, ResetPwdView, \
    ModifyPwdView, IndexView
from .settings import MEDIA_ROOT # STATIC_ROOT

urlpatterns = [
    # url(r'^admin/', admin.site.urls),
    url(r'^xadmin/', xadmin.site.urls),
    # url(r'^$', TemplateView.as_view(template_name='index.html'), name='index'),
    url(r'^$', IndexView.as_view(), name='index'),
    url(r'^login/$', LoginView.as_view(), name='login'),
    url(r'^register/$', RegisterView.as_view(), name='register'),
    url(r'^logout/$', LogoutView.as_view(), name='logout'),
    url(r'^captcha/', include('captcha.urls')),  # 图片验证码
    url(r'^activate/(?P<activate_code>.*)/$', ActivateUserView.as_view(), name='user_activate'),
    url(r'^forgetpwd/$', ForgetPwdView.as_view(), name='forgetPwd'),
    url(r'^reset/(?P<reset_code>.*)/$', ResetPwdView.as_view(), name='resetPwd'),
    url(r'^modifypwd/$', ModifyPwdView.as_view(), name='modifyPwd'),  # 修改密码

    # 配置上传文件的访问函数
    url(r'^media/(?P<path>.*)', serve, {'document_root': MEDIA_ROOT}),
    # 静态文件访问路径
    # url(r'^static/(?P<path>.*)', serve, {'document_root': STATIC_ROOT}),

    # 课程机构url
    url(r'^org/', include('organization.urls', namespace='org')),
    # 课程url
    url(r'^course/', include('courses.urls', namespace='course')),
    # usercenter
    url('^users/', include('users.urls', namespace='users')),
    #  富文本相关url
    url('^ueditor/', include('DjangoUeditor.urls' )),

]
# 全局404页面配置
handler404 = 'users.views.page_not_found'
handler500 = 'users.views.page_error'
