{% extends '../common/layouts/layout_user.swig' %}
{% block head %}
  <title>{{ title }}</title>
  <link rel="stylesheet" href="/assets/css/account_security.css">
{% endblock %}
{% block content %}
  <div class="content">
    <div class="minBox">
      <div class="right">
        <div class="right-hear">
          <span class="account-title">{{ title }}</span>
        </div>
        <div class="account-safe">
          <span class="safe-textO">安全等级</span>
          <div class="safe-barBox">
            <div class="safe-bar"></div>
          </div>
          <span class="safe-bar-text">较高</span>
          <span class="safe-textT">建议您启动全部安全设置，以保障账户及资金安全。</span>
        </div>
        <div class="right-content">
          <div class="account-login">
            <img class="a-login-img" src="/assets/images/icon-redMove.png">
            <span class="a-login-textO">登入密码</span>
            <span class="a-login-textT">建议密码由8位以上数字、字母和特殊字符组成，并定期修改。</span>
            <a href="passwd-reset" class="a-login-btnO">去修改</a>
          </div>
          <div class="account-login">
            <img class="a-login-img" src="/assets/images/icon-redMove.png">
            <span class="a-login-textO">交易密码</span>
            <span class="a-login-textT">交易密码启用后，将作为您账号资产使用时的身份证明</span>
            <a href="payment-pwd-reset" class="a-login-btnT">去设置</a>
          </div>
        </div>
      </div>
    </div>
  </div>
{% endblock %}
