{% extends '../common/layouts/layout.swig' %}
{% block head %}
  <title>{{ title }}</title>
  <link rel="stylesheet" href="/assets/css/login.css">
  <link rel="stylesheet" href="/assets/css/validform.css">
{% endblock %}

{% block header %}
  {% include '../common/partials/member_header.swig' %}
{% endblock header %}

{% block content %}

  <div class="login">
    <img class="login-bg" src="/assets/images/member/bg.jpg" alt="">
    <div class="login-box">
      <ul class="login-type">
        <li class="scan-code">扫码登录</li>
        <li class="account">账户登录</li>
      </ul>

      <div class="login-form" style="display:none">
        <form id="login-form" action="/auth/login" method="post">
          <div class="user">
            <p>账户：</p>
            <input type="text" name="user_mobile" id="user_mobile" datatype="m" placeholder="请输入您的手机号码" nullmsg="* 请输入用户名" errormsg="* 用户名错误" value="17858939705">
            {# <input type="text" name="user_mobile" id="user_mobile" datatype="m" placeholder="请输入您的手机号码" nullmsg="* 请输入用户名" errormsg="* 用户名错误"> #}
            <span class="text-error"></span>
          </div>
          <div class="password">
            <p>密码：</p>
            <input type="password" name="user_password" id="user_password" datatype="s6-18" placeholder="请输入您的密码" nullmsg="* 请输入密码" errormsg="* 密码为8-16位数字和子母的组合，特殊字符无效" value="c1111111">
            {# <input type="password" name="user_password" id="user_password" datatype="s6-18" placeholder="请输入您的密码" nullmsg="* 请输入密码" errormsg="* 密码为8-16位数字和子母的组合，特殊字符无效"> #}
            <span class="text-error"></span>
          </div>
          <div class="operation">
            <a href="register" class="register">立即注册</a>
            <a href="find-password" class="back-pwd">找回密码</a>
          </div>
          <button type="submit" class="login-btn">登录</button>
        </form>
      </div>

      <div class="qrcode-login">
        <div class="qrcode-box">
          <div class="qrcode-border">
            <img src="" alt="" class="qrcode">
          </div>
          <div class="tip">
            <span>打开</span>
            <span class="text">手机畅想购</span>
            <span>扫描二维码</span>
          </div>
          <ul class="tags">
            <li>
              <span class="icon-l"></span><span class="text">免输入</span></li>
            <li>
              <span class="icon-c"></span><span class="text">更换</span></li>
            <li>
              <span class="icon-r"></span><span class="text">更安全</span></li>
          </ul>
          <div class="register">
            <a href="register" class="register">立即注册</a>
            <span class="icon"></span>
          </div>
        </div>
      </div>

    </div>
  </div>

  <script src="/assets/js/utils/validform.js"></script>
  <script src="/assets/js/utils/alert.min.js"></script>
  <script src="/assets/js/member/login.js"></script>
{% endblock %}

{% block sidebar %}{% endblock siderbar%}

{% block footer %}
  {% include '../common/partials/member_footer.swig' %}
{% endblock footer %}
