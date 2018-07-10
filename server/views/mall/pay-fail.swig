{% extends '../common/layouts/layout.swig' %}
{% block head %}
<title>{{ title }}</title>
<link rel="stylesheet" href="/assets/css/pay_return.css">
{% endblock %}
{% block content %}
  <div class="header-line"></div>
  <div class="pay-return-body">
    <div id="fail" class="return-card w">
      <div class="r-left">
        <span class="r-icon icon-fail"></span>
      </div>
      <div class="r-right">
        <p class="r-title">抱歉，支付失败了！</p>
        <p class="r-msg">
          <span class="r-msg-item">支付遇到了问题，可能由于网络等原因，您暂时无法付款。</span>
        </p>
        <p class="r-msg">
          <span class="r-msg-item">请尝试重新支付~</span>
        </p>
        <div class="btn-group">
          <button type="button" name="button" class="btn btn-left">重新支付</button>
          <button type="button" name="button" class="btn btn-right">放弃支付</button>
        </div>
      </div>
    </div>
  </div>
{% endblock %}
