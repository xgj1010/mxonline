__author__ = 'xue'
__date__ = '2017/11/20 19:47'
from django import forms
from captcha.fields import CaptchaField

from users.models import UserProfile


class LoginForm(forms.Form):
    """登录表单"""
    username = forms.CharField(required=True)
    password = forms.CharField(required=True, min_length=6)


class RegisterForm(forms.Form):
    """注册表单"""
    email = forms.EmailField(required=True)
    password = forms.CharField(required=True, min_length=6)
    captcha = CaptchaField(error_messages={'invalid': "验证码错误！"})


class ForgetPwdForm(forms.Form):
    """忘记密码"""
    email = forms.EmailField(required=True)
    captcha = CaptchaField(error_messages={'invalid': '验证码错误！'})


class ModifyPwdForm(forms.Form):
    """忘记密码"""
    password1 = forms.CharField(required=True, min_length=6)
    password2 = forms.CharField(required=True, min_length=6)


class UserInfoForm(forms.ModelForm):
    class Meta:
        model = UserProfile
        fields = ['nick_name', 'gender', 'birthday', 'address', 'mobile', 'email']


class UploadImageForm(forms.ModelForm):
    class Meta:
        model = UserProfile
        fields = ['image']
