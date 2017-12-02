__author__ = 'xue'
__date__ = '2017/11/25 22:40'
from django.conf.urls import url

from .views import CourseListView, CourseDetailView, CourseInfoView, CourseCommentsView, AddCommentsView, VideoPlayView

urlpatterns = [
    url(r'^list/$', CourseListView.as_view(), name='course_list'),
    url(r'^detail/(?P<course_id>\d+)/$', CourseDetailView.as_view(), name='course_detail'),
    url(r'^info/(?P<course_id>\d+)/$', CourseInfoView.as_view(), name='course_info'),
    url(r'^comment/(?P<course_id>\d+)/$', CourseCommentsView.as_view(), name='course_comment'),
    url(r'^add_comment/$', AddCommentsView.as_view(), name='add_comment'),
    url(r'^play/(?P<video_id>\d+)$', VideoPlayView.as_view(), name='play'),

]
