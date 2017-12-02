__author__ = 'xue'
__date__ = '2017/11/23 18:33'

from django.conf.urls import url
from .views import OrgListView, AddUserAskView, OrgHomeView, OrgCourseView, OrgTeacherView, OrgDescView, FavoriteView, \
    TeacherListView, TeacherDetailView

urlpatterns = [
    url(r'^list/$', OrgListView.as_view(), name='org_list'),
    url(r'^add_ask/$', AddUserAskView.as_view(), name='add_ask'),
    url(r'^home/(?P<org_id>\d+)$', OrgHomeView.as_view(), name='home'),
    url(r'^course/(?P<org_id>\d+)$', OrgCourseView.as_view(), name='course'),
    url(r'^teacher/(?P<org_id>\d+)$', OrgTeacherView.as_view(), name='teacher'),
    url(r'^desc/(?P<org_id>\d+)$', OrgDescView.as_view(), name='desc'),
    url(r'^add_fav', FavoriteView.as_view(), name='add_fav'),
    url(r'^teacher/list/$', TeacherListView.as_view(), name="teacher_list"),
    url(r'^teacher/detail/(?P<teacher_id>\d+)/$', TeacherDetailView.as_view(), name="teacher_detail"),
]
