{% extends '../common/layouts/layout.swig' %}
{% block head %}
  <title>{{title}}</title>
  <link rel="stylesheet" href="/assets/css/staging.css">
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
  <div class="staging">
    <div class="common-w">
      <div class="staging-top common-clearfloat">
        <span class="common-left">
          <span class="staging-order-num">分期申请提交成功，请您尽快确认！分期单号： 183529856436154</span>
          <span class="staging-order-time">请您在
            <span class="staging-order-timer">
              <span class="hour"></span>
              :
              <span class="minute"></span>
              :
              <span class="second"></span>
            </span>内完成分期，超时自动取消。
          </span>
        </span>
        <span class="staging-order-amount common-right">
          可分期付款金额<i class="staging-order-amountNum">950.48</i>元
        </span>
      </div>
      <div class="staging-main common-w">
        <div class="staging-main-top">
          <div class="staging-main-topTxt">
            <span class="staging-main-topTitle">选择分期</span>
            <span class="staging-main-topAmo">可用额度10000.00元</span>
            <span class="staging-main-topDate">白条还款日 2017-10-10</span>
          </div>
          <div class="staging-main-topChose">
            <ul class="common-clearfloat">
              <li class="staging-main-topChoseA">
                <span class="staging-main-topDate">3期</span>
                <span>319.68元/期</span>
                <span>（含服务费2.85）</span>
              </li>
              <li>
                <span class="staging-main-topDate">6期</span>
                <span>319.68元/期</span>
                <span>（含服务费2.85）</span>
              </li>
              <li>
                <span class="staging-main-topDate">9期</span>
                <span>319.68元/期</span>
                <span>（含服务费2.85）</span>
              </li>
              <li>
                <span class="staging-main-topDate">12期</span>
                <span>319.68元/期</span>
                <span>（含服务费2.85）</span>
              </li>
            </ul>
          </div>
        </div>
        <div class="staging-main-bottom">
          <div class="staging-main-bottomTxt">请输入六位密码</div>
          <div class="staging-main-bottomIn">
            <input type="password" maxlength="6" name="" value="">
            <a class="staging-main-pwd" href="/account/payment-pwd">忘记支付密码？</a>
          </div>
          <div class="staging-main-bottomBtn">
            <button type="button" name="button" onclick="javascript:window.location.href='/pay-success'"></button>
          </div>
        </div>
      </div>
    </div>
  </div>
{% endblock %}
