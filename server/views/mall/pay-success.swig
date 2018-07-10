{% extends '../common/layouts/layout.swig' %}
{% block head %}
<title>{{ title }}</title>
<link rel="stylesheet" href="/assets/css/pay_return.css">
{% endblock %}
{% block content %}
  <div class="header-line"></div>
  <div class="pay-return-body">
    <div id="success" class="return-card w">
      <div class="r-left">
        <span class="r-icon icon-success"></span>
      </div>
      <div class="r-right">
        <p class="r-title">恭喜您，支付成功！</p>
        <p class="r-msg">
          <span class="r-msg-item">订单编号：2323131332315646</span>
          <span class="r-msg-item">支付方式：支付宝</span>
        </p>
        <p class="r-msg">
          <span class="r-msg-item">交易时间：2017/11/06 12:44</span>
        </p>
        <div class="btn-group">
          <button type="button" name="button" class="btn btn-left">继续购物</button>
          <button type="button" name="button" class="btn btn-right">查看订单</button>
        </div>
      </div>
    </div>
  </div>
{% endblock %}
