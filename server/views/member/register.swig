{% extends '../common/layouts/layout.swig' %}
{% block head %}
  <title>{{ title }}</title>
  <link rel="stylesheet" href="/assets/css/register.css">
  <link rel="stylesheet" href="/assets/css/validform.css">
{% endblock %}

{% block sidebar %}{% endblock siderbar%}

{% block header %}
  {% include '../common/partials/member_header.swig' %}
{% endblock header %}

{% block content %}

  <div class="register-box">
    <div class="top">
      <div class="wx-tip">温馨提示：每个手机号码只能注册一个账户</div>
      <div class="tel">
        <label for="tel">手机号码</label>
        <input type="text" name="user_mobile" id="tel" datatype="m" placeholder="请输入您的手机号码" nullmsg="* 请输入手机号码" errormsg="* 手机号码格式错误"/>
        <span class="text-error" style="left:71px;bottom:0"></span>
        <div class="tip">*完成验证后您可以用该手机号登录和找回密码</div>
      </div>
      <div class="pwd">
        <label for="pwd">密码</label>
        <input type="password" name="user_password" id="pwd" placeholder="请设置您的登录密码" datatype="pwd" errormsg="* 密码为8-16位数字和子母的组合，特殊字符无效" nullmsg="* 密码不能为空"/>
        <span class="text-error" style="left:71px;bottom:0"></span>
        <div class="tip">*8-16位数字和子母的组合，特殊字符无效</div>
      </div>
      <div class="pwd-confirm">
        <label for="pwd-confirm">确认密码</label>
        <input type="password" name="confirm_password" id="pwd-confirm" placeholder="请再次输入您的登录密码" datatype="n6-16" errormsg="* 密码不一致" nullmsg="* 密码不能为空" recheck="user_password"/>
        <span class="text-error" style="left:71px;bottom:0"></span>
        <div class="tip"></div>
      </div>
      <div class="yzm">
        <label for="yzm">验证码</label>
        <input type="text" name="verify_code" id="yzm"/>
        <div class="img">
          <img class="random" src="" alt="captcha">
        </div>
        <span class="switch">换一张</span>
      </div>
      <div class="tel-yzm">
        <label for="tel-yzm">手机验证码</label>
        <input type="text" name="code" id="tel-yzm"/>
        <span class="text-error" style="left:71px;bottom:0"></span>
        <button class="getyzm">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
      </div>
    </div>

    <div class="bottom">
      <div class="agreement">
        <input type="checkbox" name="agree" id="agree">
        <span class="text">我同意并遵守</span>
        <span>《畅想购白条服务协议》</span>
      </div>
      <button class="next">下一步</button>
    </div>

  </div>

  <script src="/assets/js/common/random.js"></script>
  <script src="/assets/js/utils/validform.js"></script>
  <script src="/assets/js/member/register.js"></script>
  <script src="/assets/js/utils/alert.min.js"></script>
  <script src="/assets/js/common/sms.js"></script>
{% endblock %}

{% block footer %}
  {% include '../common/partials/member_footer.swig' %}
{% endblock footer %}
