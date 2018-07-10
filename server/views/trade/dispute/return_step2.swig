{% extends '../../common/layouts/layout_user.swig' %}
{% block head %}
  <title>{{ title }}</title>
  <link rel="stylesheet" href="/assets/css/return_consult.css">
  <link rel="stylesheet" href="/assets/css/return_layout.css">
  <link rel="stylesheet" href="/assets/css/return_step2.css">
  <link rel="stylesheet" href="/assets/css/return_detail.css">
  <link rel="stylesheet" href="/assets/css/hot_production.css">
{% endblock %}
{% block content %}
  <div class="return-container">
    <div class="title">
      退货/退款
    </div>
    {% if type === '1' %}
      <div class="tab-group">
        <div class="tab done">
          <div class="tab-content">
            <div class="circle">
              1
            </div>
            <span class="text">
              买家申请退款
            </span>
          </div>
        </div>
        <div class="tab actived">
          <div class="tab-content">
            <div class="circle">
              2
            </div>
            <span class="text">
              卖家处理退款申请
            </span>
          </div>
        </div>
        <div class="tab">
          <div class="tab-content">
            <div class="circle">
              3
            </div>
            <span class="text">
              退款完毕
            </span>
          </div>
        </div>
      </div>
    {% else %}
      <div class="tab-group-1">
        <div class="tab done" style="width:25%;">
          <div class="tab-content">
            <div class="circle">
              1
            </div>
            <span class="text">
              买家申请退款
            </span>
          </div>
        </div>
        <div class="tab actived" style="width:25%;">
          <div class="tab-content">
            <div class="circle">
              2
            </div>
            <span class="text">
              卖家处理退款申请
            </span>
          </div>
        </div>
        <div class="tab" style="width:25%;">
          <div class="tab-content">
            <div class="circle">
              3
            </div>
            <span class="text">
              买家退货
            </span>
          </div>
        </div>
        <div class="tab" style="width:25%;">
          <div class="tab-content">
            <div class="circle">
              4
            </div>
            <span class="text">
              退款完毕
            </span>
          </div>
        </div>
      </div>
    {% endif %}
    <div class="return-step2-container">
      <div class="step2-main">
        <div style="font-size:18px;color:#333;">
          请等待商家处理
        </div>
        <div style="margin-top:27px;">
          您已成功发起退款申请，请耐心等待商家处理
        </div>
        <div style="margin-top:27px;" class="line-container">
          <span class="line-point">&bull;</span>卖家同意，系统将退款给您或恢复您的白条额度
        </div>
        <div style="margin-top:10px;" class="line-container">
          <span class="line-point">&bull;</span>卖家拒绝，您可以修改退款申请后再次发起，卖家会重新处理
        </div>
        <div class="btn-group">
          <div class="btn-left">
            撤销申请
          </div>
          <div class="btn-right">
            修改申请
          </div>
        </div>
      </div>
      <div class="return-detail-container">
        {% include "./return_detail.swig" %}
      </div>
      <div class="return-consult-container">
        {% include "./return_consult.swig" %}
      </div>
    </div>

  </div>
  <div class="hot-product-container">
    {% include "./hot_production.swig" %}
  </div>
  <script src="/assets/js/dispute/hot_production.js"></script>
{% endblock %}
