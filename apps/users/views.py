import json

from django.db.models import Q  # 求并集
from django.shortcuts import render
from django.views.generic.base import View
from django.contrib.auth import authenticate, login, logout  # 数据库验证，登录
from django.http import HttpResponseRedirect, HttpResponse
from django.core.urlresolvers import reverse
from django.contrib.auth.backends import ModelBackend
from django.contrib.auth.hashers import make_password  # 密码加密
from pure_pagination import Paginator, PageNotAnInteger

from courses.models import Course
from operation.models import UserMessage, UserCourse, UserFavorite
from organization.models import CourseOrg, Teacher
from .forms import LoginForm, RegisterForm, ForgetPwdForm, ModifyPwdForm, UserInfoForm, UploadImageForm
from .models import UserProfile, EmailVerifyRecord, Banner
from utils.email_send import send_register_email
from utils.mixin_utils import LoginRequiredMixin


class CustomBackend(ModelBackend):
    """自定义登录，用户名或者邮箱"""

    def authenticate(self, request, username=None, password=None, **kwargs):
        try:
            user = UserProfile.objects.get(Q(username=username) | Q(email=username))  # get方法查找一个
            if user.check_password(password):
                return user
        except Exception as e:
            return None


class LoginView(View):
    """用户登录"""

    def get(self, request):
        return render(request, 'login.html', {})

    def post(self, request):
        login_form = LoginForm(request.POST)
        # 表单验证
        if login_form.is_valid():
            user_name = request.POST.get('username', '')
            pass_word = request.POST.get('password', '')
            # 数据库验证
            user = authenticate(username=user_name, password=pass_word)
            if user is not None:  # 用户不为空
                if user.is_active:  # 用户已经激活
                    login(request, user)
                    return HttpResponseRedirect(reverse('index'))
                else:
                    return render(request, 'login.html', {'msg': '用户未激活！'})
            else:
                return render(request, 'login.html', {'msg': '用户名或密码错误！'})
        else:
            return render(request, 'login.html', {'login_form': login_form})


class LogoutView(View):
    """用户退出"""

    def get(self, request):
        logout(request)
        from django.core.urlresolvers import reverse  # 将url名字反解成url地址
        return HttpResponseRedirect(reverse('login'))


class RegisterView(View):
    """用户注册"""

    def get(self, request):
        register_form = RegisterForm()
        return render(request, 'register.html', {'register_form': register_form})

    def post(self, request):
        register_form = RegisterForm(request.POST)
        # 表单验证
        if register_form.is_valid():
            user_name = request.POST.get('email', '')  # 表单中的用户名
            # 数据库验证
            if UserProfile.objects.filter(email=user_name):
                return render(request, 'register.html', {'register_form': register_form, 'msg': "用户名已经存在！"})
            pass_word = request.POST.get('password', '')  # 表单中的密码
            user = UserProfile()  # 实例化用户对象
            user.username = user_name
            user.email = user_name
            user.password = make_password(pass_word)
            user.is_active = False  # 未激活
            user.save()  # 保存进数据库

            user_message = UserMessage()  # 实例化用户消息对象
            user_message.user = user.id
            user_message.message = '欢迎注册慕课学院'
            user_message.save()

            send_register_email(user_name, 'register')
            return render(request, 'login.html')
        else:
            return render(request, 'register.html', {'register_form': register_form})


class ActivateUserView(View):
    """激活"""

    def get(self, request, activate_code):
        all_records = EmailVerifyRecord.objects.filter(code=activate_code)
        if all_records:
            for record in all_records:
                email = record.email
                user = UserProfile.objects.get(email=email)
                user.is_active = True
                user.save()
        else:
            return render(request, 'active_fail.html')
        return render(request, 'login.html')


class ForgetPwdView(View):
    """忘记密码"""

    def get(self, request):
        forgetpwd_form = ForgetPwdForm()
        return render(request, 'forgetpwd.html', {'forgetpwd_form': forgetpwd_form})

    def post(self, request):
        forgetpwd_form = ForgetPwdForm(request.POST)
        if forgetpwd_form.is_valid():
            email = request.POST.get('email', '')
            send_register_email(email, 'forgetpwd')
            return render(request, 'send_success.html')
        else:
            return render(request, 'forgetpwd.html', {'forgetpwd_form': forgetpwd_form})


class ResetPwdView(View):
    """重置密码"""

    def get(self, request, reset_code):
        all_records = EmailVerifyRecord.objects.filter(code=reset_code)
        if all_records:
            for record in all_records:
                email = record.email
                return render(request, 'password_reset.html', {'email': email})
        else:
            return render(request, 'active_fail.html')
        return render(request, 'login.html')


class ModifyPwdView(View):
    """修改密码"""

    def post(self, request):
        modifypwd_form = ModifyPwdForm(request.POST)
        if modifypwd_form.is_valid():
            pwd1 = request.POST.get('password1', '')
            pwd2 = request.POST.get('password2', '')
            email = request.POST.get('email', '')
            if pwd1 != pwd2:
                return render(request, 'password_reset.html', {'email': email, 'msg': '密码不一致！'})
            user = UserProfile.objects.get(email=email)
            user.password = make_password(pwd2)
            user.save()
            return render(request, 'login.html')
        else:
            email = request.POST.get('email', '')
            return render(request, 'password_reset.html', {'email': email, 'modifypwd_form': modifypwd_form})


class UserCenterInfoView(LoginRequiredMixin, View):
    """用户信息"""

    def get(self, request):
        current_page = 'info'
        return render(request, 'usercenter-info.html', {
            'current_page': current_page
        })

    def post(self, request):
        user_info_form = UserInfoForm(request.POST, instance=request.user)
        if user_info_form.is_valid():
            user_info_form.save()
            return HttpResponse('{"status":"success"}', content_type='application/json')
        else:
            return HttpResponse(json.dumps(user_info_form.errors), content_type='application/json')


class UpdatePwdView(View):
    """个人中心修改密码"""

    def post(self, request):
        modify_form = ModifyPwdForm(request.POST)
        if modify_form.is_valid():
            pwd1 = request.POST.get("password1", "")
            pwd2 = request.POST.get("password2", "")
            if pwd1 != pwd2:
                return HttpResponse('{"status":"fail","msg":"密码不一致"}', content_type='application/json')
            user = request.user
            user.password = make_password(pwd2)
            user.save()

            return HttpResponse('{"status":"success"}', content_type='application/json')
        else:
            return HttpResponse(json.dumps(modify_form.errors), content_type='application/json')


class UploadImageView(LoginRequiredMixin, View):
    """
    用户修改头像
    """

    def post(self, request):
        # image_form = UploadImageForm(request.POST, request.FILES)
        # if image_form.is_valid():
        #     image = image_form.cleaned_data['image']
        #     request.user.image = image
        #     request.user.save()
        #  instance 用于实例化modelform对象 UserProfile
        image_form = UploadImageForm(request.POST, request.FILES, instance=request.user)
        if image_form.is_valid():
            image_form.save()
            return HttpResponse('{"status":"success"}', content_type='application/json')
        else:
            return HttpResponse('{"status":"fail"}', content_type='application/json')


class SendEmailCodeView(LoginRequiredMixin, View):
    """
    发送邮箱验证码
    """

    def get(self, request):
        email = request.GET.get('email', '')

        if UserProfile.objects.filter(email=email):
            return HttpResponse('{"email":"邮箱已经存在"}', content_type='application/json')
        send_register_email(email, "update_email")

        return HttpResponse('{"status":"success"}', content_type='application/json')


class UpdateEmailView(LoginRequiredMixin, View):
    """
    修改个人邮箱
    """

    def post(self, request):
        email = request.POST.get('email', '')
        code = request.POST.get('code', '')

        existed_records = EmailVerifyRecord.objects.filter(email=email, code=code, send_type='update_email')
        if existed_records:
            user = request.user
            user.email = email
            user.save()
            return HttpResponse('{"status":"success"}', content_type='application/json')
        else:
            return HttpResponse('{"email":"验证码出错"}', content_type='application/json')


class MyCourseView(LoginRequiredMixin, View):
    """
    我的课程
    """

    def get(self, request):
        current_page = 'mycourse'
        user_courses = UserCourse.objects.filter(user=request.user)
        return render(request, 'usercenter-mycourse.html', {
            "user_courses": user_courses,
            "current_page": current_page
        })


class MyFavOrgView(LoginRequiredMixin, View):
    """
    我收藏的课程机构
    """

    def get(self, request):
        current_page = 'myfav'
        org_list = []
        fav_orgs = UserFavorite.objects.filter(user=request.user, fav_type=2)
        for fav_org in fav_orgs:
            org_id = fav_org.fav_id
            org = CourseOrg.objects.get(id=org_id)
            org_list.append(org)
        return render(request, 'usercenter-fav-org.html', {
            "org_list": org_list,
            "current_page": current_page
        })


class MyFavTeacherView(LoginRequiredMixin, View):
    """
    我收藏的授课讲师
    """

    def get(self, request):
        current_page = 'myfav'
        teacher_list = []
        fav_teachers = UserFavorite.objects.filter(user=request.user, fav_type=3)
        for fav_teacher in fav_teachers:
            teacher_id = fav_teacher.fav_id
            teacher = Teacher.objects.get(id=teacher_id)
            teacher_list.append(teacher)
        return render(request, 'usercenter-fav-teacher.html', {
            "teacher_list": teacher_list,
            "current_page": current_page
        })


class MyFavCourseView(LoginRequiredMixin, View):
    """
    我收藏的课程
    """

    def get(self, request):
        current_page = 'myfav'
        course_list = []
        fav_courses = UserFavorite.objects.filter(user=request.user, fav_type=1)
        for fav_course in fav_courses:
            course_id = fav_course.fav_id
            teacher = Course.objects.get(id=course_id)
            course_list.append(teacher)
        return render(request, 'usercenter-fav-course.html', {
            "course_list": course_list,
            "current_page": current_page
        })


class MymessageView(LoginRequiredMixin, View):
    """
    我的消息
    """

    def get(self, request):
        current_page = 'mymessage'
        all_messages = UserMessage.objects.filter(user=request.user.id)

        # 用户进入个人消息后清空未读消息的记录
        all_unread_messages = UserMessage.objects.filter(user=request.user.id, has_read=False)
        for unread_message in all_unread_messages:
            unread_message.has_read = True
            unread_message.save()

        # 对个人消息进行分页
        try:
            page = request.GET.get('page', 1)
        except PageNotAnInteger:
            page = 1

        p = Paginator(all_messages, 5, request=request)

        messages = p.page(page)
        return render(request, 'usercenter-message.html', {
            "messages": messages,
            "current_page": current_page
        })


class IndexView(View):
    # 慕学在线网 首页
    def get(self, request):
        # 取出轮播图
        # print(1 / 0)  # 服务器异常500错误
        all_banners = Banner.objects.all().order_by('index')[:5]
        courses = Course.objects.filter(is_banner=False)[:6]
        banner_courses = Course.objects.filter(is_banner=True)[:3]
        course_orgs = CourseOrg.objects.all()[:15]
        return render(request, 'index.html', {
            'all_banners': all_banners,
            'courses': courses,
            'banner_courses': banner_courses,
            'course_orgs': course_orgs
        })


def page_not_found(request):
    # 全局404处理函数
    from django.shortcuts import render_to_response
    response = render_to_response('404.html', {})
    response.status_code = 404
    return response


def page_error(request):
    # 全局500处理函数
    from django.shortcuts import render_to_response
    response = render_to_response('500.html', {})
    response.status_code = 500
    return response
