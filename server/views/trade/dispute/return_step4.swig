{% extends '../../common/layouts/layout_user.swig' %}
{% block head %}
  <title>{{ title }}</title>
  <link rel="stylesheet" href="/assets/css/return_consult.css">
  <link rel="stylesheet" href="/assets/css/return_layout.css">
  <link rel="stylesheet" href="/assets/css/return_step4.css">
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
        <div class="tab done">
          <div class="tab-content">
            <div class="circle">
              2
            </div>
            <span class="text">
              卖家处理退款申请
            </span>
          </div>
        </div>
        <div class="tab actived no-triangle">
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
        <div class="tab done" style="width:25%;">
          <div class="tab-content">
            <div class="circle">
              2
            </div>
            <span class="text">
              卖家处理退款申请
            </span>
          </div>
        </div>
        <div class="tab done" style="width:25%;">
          <div class="tab-content">
            <div class="circle">
              3
            </div>
            <span class="text">
              买家退货
            </span>
          </div>
        </div>
        <div class="tab actived no-triangle" style="width:25%;">
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
      <div class="step4-main">
        <div>
          <div class="reutrn-step4-money">
            退款金额：￥398.00
          </div>
          <div style="font-size:18px;">
            退款成功
          </div>
        </div>
        <div class="return-step4-time">
          退款成功时间：2017-10-09 10:07
        </div>
        <div class="return-step4-img-container">
          <img src="/assets/images/return/progress.png" alt="">
        </div>
        <div class="progress-text-container fl">
          <div class="progress-text-line1">
            卖家处理
          </div>
          <div class="progress-text-line2">
            2017-10-08 10:29
          </div>
        </div>
        <div class="progress-text-container fr">
          <div class="progress-text-line1">
            退款成功
          </div>
          <div class="progress-text-line2">
            2017-10-09 10:29
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
