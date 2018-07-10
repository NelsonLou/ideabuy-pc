{% extends '../common/layouts/layout.swig' %}
{% block head %}
<title>{{ title }}</title>
<link rel="stylesheet" href="/assets/css/identification.css">
{% endblock %}
{% block header %}
  {% include '../common/partials/header_user.swig' %}
{% endblock header %}
{% block sidebar %}
{% endblock sidebar %}
{% block content %}
  <div class="act-body">
    <div class="act-content">
      <p class="act-title">请输入您的姓名、身份证，仅用于身份验证</p>
      <form class="act-form" id="editidcard">
        <div class="act-form-item">
          <span class="act-label" for="username">姓&nbsp;&nbsp;名</span>
          <input class="act-input" id="username" name="username" type="text" placeholder="请输入您的姓名">
          {# <span id="placeholderFir" class="act-placeholder">请输入您的姓名</span> #}
          <span id="clearFir" class="act-input-clear"></span>
        </div>
        <div class="act-form-item">
          <span class="act-label" for="idcard">身份证</span>
          <input class="act-input" id="idcard" name="idcard" type="text" placeholder="请输入您的身份证号码">
          {# <span id="placeholderSec" class="act-placeholder">请输入您的身份证号码</span> #}
          <span id="clearSec" class="act-input-clear"></span>
        </div>
        <p class="act-tips">* 一个身份证只能申请一个白条账户</p>
        <div class="act-btn-submit">下一步</div>
      </form>
    </div>
    <div class="act-layer"></div>
    <div class="act-overlay">
      <div class="act-overlay-window">
        <p class="act-overlay-window-title">身份有误将影响授信结果，请确认</p>
        <p class="act-overlay-window-name"></p>
        <p class="act-overlay-window-idcard"></p>
        <div class="act-overlay-window-btn-group">
          <span id="modify" class="act-overlay-window-btn">返回修改</span>
          <span id="confirm" class="act-overlay-window-btn act-btn-right">确认无误</span>
        </div>
      </div>
    </div>
    <div class="act-res-layer"></div>
    <div class="act-res-overlay">
      <div class="act-overlay-window-fail">
        <p class="act-overlay-window-top"><span id="resClose" class="act-overlay-close"></span></p>
        <div class="act-overlay-window-icon"></div>
        <p class="act-overlay-window-msg"></p>
        <div id="resAllright" class="act-overlay-window-btn">我知道了</div>
      </div>
    </div>
  </div>

  <script src="/assets/js/ious/identification.js"></script>
{% endblock %}
