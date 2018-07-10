{% extends '../common/layouts/layout.swig' %}
{% block head %}
<title>{{ title }}</title>
<link rel="stylesheet" href="/assets/css/complete_credit.css">
{% endblock %}
{% block header %}
  {% include '../common/partials/header_user.swig' %}
{% endblock header %}
{% block sidebar %}
{% endblock sidebar %}
{% block content %}
  <div class="act-body">
    <div class="act-content">
      <div class="act-comp-img"></div>
      <p class="act-comp-title">恭喜您通过审核</p>
      <p class="act-comp-msg">获得<span class="act-comp-msg-num">5000元</span>白条额度</p>
      <div class="act-comp-btn-shop">去购物</div>
    </div>
  </div>
{% endblock %}
