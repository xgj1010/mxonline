__author__ = 'xue'
__date__ = '2017/11/23 22:55'
import re

from django import forms

from operation.models import UserAsk


# class UserAskForm(forms.Form):
#     name = forms.CharField(required=True, min_length=2, max_length=20)
#     phone = forms.CharField(required=True, min_length=11, max_length=11)
#     course_name = forms.CharField(required=True, min_length=5, max_length=50)

class UserAskForm(forms.ModelForm):
    """将model直接转换成form"""

    # my_filed = forms.CharField()  # 添加需要的字段
    class Meta:
        model = UserAsk
        fields = ['name', 'mobile', 'course_name']  # 选择需要的字段

    def clean_mobile(self):
        """自定义表单验证方法
        验证手机号是否合法
        """
        mobile = self.cleaned_data['mobile']
        REGEX_MOBILE = "^[1][3,4,5,7,8][0-9]{9}$"
        p = re.compile(REGEX_MOBILE)
        if p.match(mobile):
            return mobile
        else:
            raise forms.ValidationError('手机号码非法', code="mobile_invalid")
