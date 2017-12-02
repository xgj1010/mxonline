__author__ = 'xue'
__date__ = '2017/11/28 20:06'
from django.conf.urls import url
from .views import UserCenterInfoView, UpdatePwdView, UploadImageView, SendEmailCodeView, UpdateEmailView, MyCourseView, \
    MyFavOrgView, MyFavTeacherView, MyFavCourseView, MymessageView

urlpatterns = [
    # 用户中心
    url(r'^info/$', UserCenterInfoView.as_view(), name='user_info'),
    # 修改头像
    url(r'^image/upload/$', UploadImageView.as_view(), name="image_upload"),
    # 修改密码
    url(r'^update/pwd/$', UpdatePwdView.as_view(), name="update_pwd"),
    # 发送邮箱验证码
    url(r'^sendemail_code/$', SendEmailCodeView.as_view(), name="sendemail_codesende"),
    # 修改邮箱
    url(r'^update_email/$', UpdateEmailView.as_view(), name="update_email"),
    # 我的课程
    url(r'^mycourse/$', MyCourseView.as_view(), name="mycourse"),
    # # 我收藏的课程机构
    url(r'^myfav/org/$', MyFavOrgView.as_view(), name="myfav_org"),
    # 我收藏的授课讲师
    url(r'^myfav/teacher/$', MyFavTeacherView.as_view(), name="myfav_teacher"),
    # 我收藏的课程
    url(r'^myfav/course/$', MyFavCourseView.as_view(), name="myfav_course"),
    # # 我的消息
    url(r'^mymessage/$', MymessageView.as_view(), name="mymessage"),
]
