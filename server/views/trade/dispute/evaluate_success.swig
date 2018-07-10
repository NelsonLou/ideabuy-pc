{% extends '../../common/layouts/layout_user.swig' %}
{% block head %}
  <title>{{ title }}</title>
  <link rel="stylesheet" href="/assets/css/evaluate_success.css">
  <link rel="stylesheet" href="/assets/css/hot_production.css">
{% endblock %}
{% block content %}
  <div class="evaluate-success-container">
    <div style="font-size:16px;">
      宝贝评价
    </div>
    <div class="success-top">
      <img src="/assets/images/evaluate/success.png" width="35" height="35">
      <div class="success-top-detail">
        <div class="line1">
          宝贝评价成功！您的白条额度提升了<span style="color:#ff3636;">100</span>元！<span style="margin-left:30px;font-size:14px;color:#315ede;cursor:pointer;">查看评价</span>
        </div>
        <div style="margin-top:18px;">
          当前白条总额度：￥5000.50
        </div>
        <div style="margin-top:18px;">
          当前信用分：<span style="color:#FD7E24;">560.1</span>
        </div>
      </div>
    </div>
    <div style="border-top:2px solid #f7f7f7;margin-top:35px;"></div>
    <div class="success-bottom">
      <div style="font-size:16px;">
        其他待评价宝贝（评价可以提升白条额度~）
      </div>
      <div class="other-evaluate-group">
        <div class="other-evaluate">
          <img src="/assets/images/return/phone.jpg" width="96" height="96">
          <div class="other-evaluate-name">
            17SS Noah NYC Tee
          </div>
          <div>
            颜色： 黑色
          </div>
          <div>
            尺码M
          </div>
          <div class="other-evaluate-btn">
            评价
          </div>
        </div>
        <div class="other-evaluate">
          <img src="/assets/images/return/phone.jpg" width="96" height="96">
          <div class="other-evaluate-name">
            17SS Noah NYC Tee
          </div>
          <div>
            颜色： 黑色
          </div>
          <div>
            尺码M
          </div>
          <div class="other-evaluate-btn">
            评价
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="hot-product-container">
    {% include "./hot_production.swig" %}
  </div>

  <script type="text/javascript" src="/assets/js/utils/jquery.ui.widget.js"></script>
  <script type="text/javascript" src="/assets/js/utils/jquery.iframe-transport.js"></script>
  <script type="text/javascript" src="/assets/js/utils/jquery.fileupload.js"></script>
  <script src="/assets/js/dispute/hot_production.js"></script>
{% endblock %}
