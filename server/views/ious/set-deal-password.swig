{% extends '../common/layouts/layout.swig' %}
{% block head %}
<title>{{ title }}</title>
<link rel="stylesheet" href="/assets/css/set_deal_password.css">
{% endblock %}
{% block header %}
  {% include '../common/partials/header_user.swig' %}
{% endblock header %}
{% block sidebar %}
{% endblock sidebar %}
{% block content %}
  <div class="act-body">
    <div class="act-content">
      <p class="act-title">设置交易密码，保证借还款安全</p>
      <form class="act-form" id="setpaypwd">
        <div class="act-form-item">
          <span class="act-label" for="passwordFir">设置密码</span>
          <input class="act-input" id="passwordFir" name="passwordFir" type="password" maxlength="6" placeholder="请输入6位数字作为密码" onkeypress="return event.keyCode>=48 && event.keyCode<=57">
          <span id="clearFir" class="act-input-clear"><i class="icon-clear"></i></span>
          <p id="verifyFir" class="act-form-verify"><span class="act-input-tips-icon"></span><span class="act-input-tips">请输入6位数字作为密码</span></p>
        </div>
        <div class="act-form-item">
          <span class="act-label" for="passwordSec">确认密码</span>
          <input class="act-input" id="passwordSec" name="passwordSec" type="password" maxlength="6" placeholder="请再次输入您的密码" onkeypress="return event.keyCode>=48 && event.keyCode<=57">
          <span id="clearSec" class="act-input-clear"><i class="icon-clear"></i></span>
          <p id="verifySec" class="act-form-verify"><span class="act-input-tips-icon"></span><span class="act-input-tips">第二次与第一次输入密码不相同</span></p>
        </div>
        <div id="formSubmit" class="act-btn-submit">下一步</div>
      </form>
    </div>
    {% if content.code !== 1 %}
      <div class="act-res-layer"></div>
      <div class="act-res-overlay">
        <div class="act-overlay-window-fail">
          <p class="act-overlay-window-top"><span id="resClose" class="act-overlay-close"></span></p>
          <div class="act-overlay-window-icon"></div>
          <p class="act-overlay-window-msg"></p>
          <div id="resAllright" class="act-overlay-window-btn">我知道了</div>
        </div>
      </div>
    {% endif %}
  </div>

  <script src="/assets/js/ious/set_deal_password.js"></script>
{% endblock %}
