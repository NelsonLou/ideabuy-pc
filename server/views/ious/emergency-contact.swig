{% extends '../common/layouts/layout.swig' %}
{% block head %}
<title>{{ title }}</title>
<link rel="stylesheet" href="/assets/css/emergency_contact.css">
{% endblock %}
{% block header %}
  {% include '../common/partials/header_user.swig' %}
{% endblock header %}
{% block sidebar %}
{% endblock sidebar %}
{% block content %}
  <div class="act-body">
    <div class="act-content">
      <p class="act-title">请为您绑定紧急联系人，以防紧急情况发生</p>
      <form class="act-form" id="userlinkAdd">
        <div class="act-form-item">
          <span class="act-label" for="linkman">联系人</span>
          <input class="act-input" id="linkman" name="linkman" type="text" placeholder="请输入联系人的姓名">
          <span id="clearFir" class="act-input-clear"><i class="icon-clear"></i></span>
        </div>
        <div class="act-form-item">
          <span class="act-label" for="cellphone">手机号码</span>
          <input class="act-input" id="cellphone" name="cellphone" type="text" placeholder="请输入联系人的手机号码">
          <span id="clearSec" class="act-input-clear"><i class="icon-clear"></i></span>
        </div>
        <div class="act-form-item">
          <span class="act-label" for="relation">关系</span>
          <input class="act-input" id="relation" name="relation" type="text" placeholder="请选择">
          <span class="act-select-icon"></span>
          <ul id="selectRelation" class="act-select-box">
            <li>家人</li>
            <li>朋友</li>
            <li>同事</li>
          </ul>
        </div>
        <p class="act-form-ask">
          <span id="agree" class="act-form-ask-checkbox"></span>
          <span class="act-form-ask-text">我同意并遵守<span class="act-form-ask-text-b">《征信及综合授权书》</span>，授权联通查询、报 送贷款信息至金融信用信息基础数据库。</span>
        </p>
        <div id="formSubmit" class="act-btn-submit">同意协议并绑定</div>
      </form>
    </div>
    <div class="act-disc">
      <div class="act-disc-title">温馨提示：</div>
      <div class="act-disc-detail">
        <p class="act-disc-detail-item">1.请确保紧急联系人姓名和手机号真实有效；</p>
        <p class="act-disc-detail-item">2.添加紧急联系人能让授信变得快速且更易通过。</p>
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

  <script src="/assets/js/ious/emergency_contact.js"></script>
{% endblock %}
