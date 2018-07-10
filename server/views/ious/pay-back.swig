{% extends '../common/layouts/layout.swig' %}
{% block head %}
  <title>{{title}}</title>
  <link rel="stylesheet" href="/assets/css/pay_back.css">
{% endblock %}
{% block header %}
  {% include '../common/partials/header_user.swig' %}
{% endblock %}
{% block footer %}
  {% include '../common/partials/footer_user.swig' %}
{% endblock %}
{% block sidebar %}{% endblock %}
{% block content %}
  <script src="/assets/js/ious/timer.js" charset="utf-8"></script>
  <div class="payback">
    <div class="common-w">
      <div class="payback-top common-clearfloat">
        <span class="common-left">
          <span class="payback-order-num">还款申请提交成功，请您尽快支付！分期单号： 183529856436154</span>
          <span class="payback-order-time">请您在
            <span class="payback-order-timer">
              <span class="hour"></span>
              :
              <span class="minute"></span>
              :
              <span class="second"></span>
            </span>内完成支付，超时自动取消。
          </span>
        </span>
        <span class="payback-order-amount common-right">
          应付金额<i class="payback-order-amountNum">950.48</i>元
        </span>
      </div>
      <div class="payback-main common-w">
        <div class="payback-main-top">
          <ul>
            <li>
              <span class="payback-choosebank-box"></span>
              <span class="payback-choosebank-logo"></span>
              <span class="payback-choosebank-name">XX银行</span>
              <span class="payback-choosebank-card">储蓄卡（5713）</span>
              <span class="payback-choosebank-amo common-right">支付金额<span class="red-font">950.48</span>元</span>
            </li>
            <li>
              <span class="payback-choosebank-box"></span>
              <span class="payback-choosebank-logo"></span>
              <span class="payback-choosebank-name">XX银行</span>
              <span class="payback-choosebank-card">储蓄卡（5713）</span>
              <span class="payback-choosebank-amo common-right">支付金额<span class="red-font">950.48</span>元</span>
            </li>
            <li class="payback-add-bank">
              <span>
                <a href="/account/bind-bank">添加/新增银行卡</a>
              </span>
            </li>
          </ul>
        </div>
        <div class="payback-main-bottom">
          <div class="payback-main-bottomTxt">请输入六位密码</div>
          <div class="payback-main-bottomIn">
            <input type="password" maxlength="6" name="" value="">
            <a class="payback-main-pwd" href="/account/payment-pwd">忘记支付密码？</a>
          </div>
          <div class="payback-main-bottomBtn">
            <button type="button" name="button" onclick="javascript:window.location.href='pay-success'">立即支付</button>
          </div>
        </div>
      </div>
    </div>
  </div>
{% endblock %}
