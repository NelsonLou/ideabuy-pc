{% extends '../common/layouts/layout.swig' %}
{% block head %}
<title>{{ title }}</title>
<link rel="stylesheet" href="/assets/css/bind_bank_card.css">
{% endblock %}
{% block header %}
  {% include '../common/partials/header_user.swig' %}
{% endblock header %}
{% block sidebar %}
{% endblock sidebar %}
{% block content %}
  <div class="act-body">
    <div class="act-content">
      <p class="act-title">使用白条服务前请先绑定您的银行卡</p>
      <form class="act-form" id="bankadd">
        <div class="act-form-item">
          <span class="act-label" for="username">持卡人</span>
          <input class="act-input" id="username" name="username" type="text" value="{{ data.content.real_name }}" disabled=“disabled”>
        </div>
        <div class="act-form-item">
          <span class="act-label" for="bankCard">银行卡号</span>
          <input class="act-input" id="bankCard" name="bankCard" type="text" placeholder="请输入您的银行卡号，仅支持储蓄卡">
          <span id="clearFir" class="act-input-clear"><i class="icon-clear"></i></span>
          <div class="act-form-bank-info">
            <div class="act-bank-info-icon"></div>
            <div class="act-bank-info-close"></div>
            <div class="act-bank-support">
              <p class="act-bank-support-title">支持银行列表</p>
              <div class="act-bank-support-content">
                <ul class="act-bank-support-list">
                  {% for key, val in data.content.bank %}
                    <li class="act-bank-support-item">
                      <img class="act-bank-icon" src="{{val.bank_logo}}" width="30px" height="30px">
                      <span class="act-bank-name">{{val.bank_name}}</span>
                    </li>
                  {% endfor %}
                </ul>
              </div>
            </div>
          </div>
        </div>
        <div class="act-form-item">
          <span class="act-label" for="cellphone">预留手机号</span>
          <input class="act-input" id="cellphone" name="cellphone" maxlength="11" type="text" placeholder="请输入您在银行预留的手机号码">
          <span id="clearSec" class="act-input-clear"><i class="icon-clear"></i></span>
        </div>
        <div class="act-form-item">
          <span class="act-label" for="msgVerify">短信验证码</span>
          <input class="act-input msg-input" id="msgVerify" name="msgVerify" maxlength="4" type="text" placeholder="请输入短信验证码">
          <span id="clearThi" class="act-input-clear"><i class="icon-clear"></i></span>
          <button id="smsSend" type="button" class="act-form-get-msg">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
          {# <p id="verifyThi" class="act-form-verify"><span class="act-input-tips-icon"></span><span class="act-input-tips">验证码有误！</span></p> #}
        </div>
        <div id="formSubmit" class="act-btn-submit">下一步</div>
      </form>
    </div>
    <div class="act-layer"></div>
    <div class="act-overlay">
      <div class="act-overlay-window-cut">
        <p class="act-overlay-window-top"><span class="act-overlay-close"></span></p>
        <p class="act-overlay-window-title">暂不支持该银行</p>
        <div class="act-overlay-window-btn-group">
          <div class="act-overlay-window-btn act-btn-help">查看解决方案</div>
          <div class="act-overlay-window-btn act-btn-right">确认</div>
        </div>
      </div>
      <div class="act-overlay-window-fail">
        <p class="act-overlay-window-top"><span class="act-overlay-close"></span></p>
        <div class="act-overlay-window-icon"></div>
        <p class="act-overlay-window-msg"></p>
        <div class="act-overlay-window-btn allright">我知道了</div>
      </div>
      <div class="act-overlay-window-help">
        <p class="act-overlay-window-top"><span class="act-overlay-close"></span></p>
        <p class="act-overlay-window-title">绑卡失败解决方案</p>
        <p class="act-overlay-window-msg">1.请与发卡行确认您的发卡行的身份证号、姓名、银 行卡号、预留手机号（网银预留手机号或快捷支付手 机号）是否与您填写的信息一致。</p>
        <p class="act-overlay-window-msg">
          2.请确保您已开通银联在线支付（无卡支付），您可以通过发卡行的客服电话或网上银行或柜面开通银联在线支付或个人电脑登录中国银联网站<br/>
          <span class="act-overlay-window-msg-link">https://www.95516.com/portal/open/init.do?etry=open</span><br/>
          开通银联在线支付。
        </p>
        <div class="act-overlay-window-btn allright-help">我知道了</div>
      </div>
    </div>
  </div>

  <script src="/assets/js/utils/alert.min.js"></script>
  <script src="/assets/js/common/sms.js"></script>
  <script src="/assets/js/ious/bind_bank_card.js"></script>
{% endblock %}
