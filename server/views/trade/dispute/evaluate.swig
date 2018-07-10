{% extends '../../common/layouts/layout_user.swig' %}
{% block head %}
  <title>{{ title }}</title>
  <link rel="stylesheet" href="/assets/css/evaluate.css">
{% endblock %}
{% block content %}
  <div class="evaluate-container">
    <div style="font-size:16px;">
      宝贝评价
    </div>
    <div class="evaluate-level-container">
      <div class="product-photo"></div>
      <div class="evaluate-level">
        <div id="description">
          <div style="padding-top:12px;margin-right:13px;">
            宝贝相关描述
          </div>
          <div class="star-container " level="1"></div>
          <div class="star-container " level="2"></div>
          <div class="star-container " level="3"></div>
          <div class="star-container" level="4"></div>
          <div class="star-container" level="5"></div>
          <div class="evaluate-level-text"></div>
        </div>
        <div id="attitude">
          <div style="padding-top:12px;margin-right:13px;">
            卖家服务态度
          </div>
          <div class="star-container" level="1"></div>
          <div class="star-container" level="2"></div>
          <div class="star-container" level="3"></div>
          <div class="star-container" level="4"></div>
          <div class="star-container" level="5"></div>
          <div class="evaluate-level-text"></div>
        </div>
        <div id="logistics">
          <div style="padding-top:12px;margin-right:13px;">
            物流服务质量
          </div>
          <div class="star-container" level="1"></div>
          <div class="star-container" level="2"></div>
          <div class="star-container" level="3"></div>
          <div class="star-container" level="4"></div>
          <div class="star-container" level="5"></div>
          <div class="evaluate-level-text"></div>
        </div>
      </div>
    </div>
    <div class="evaluate-product-name">
      17SS Noah NYC Tee
    </div>
    <div class="evaluate-product-detail">
      颜色：黑色
    </div>
    <div class="evaluate-product-detail">
      尺码：M
    </div>
    <div style="position:relative;margin-top:26px;">
      <textarea rows="6" cols="80" class="evaluate-textarea"></textarea>
      <div class="my-placeholder">
        请对该商品、物流、商家服务态度进行评价
      </div>
    </div>
    <div style="margin-top:35px;font-size:16px;">
      晒图
    </div>
    <div style="margin-top:24px;">
      <div class="upload-img-container"></div>
      <div id="myupload" class="my-upload">
        <form action="/upload" method="post">
          <input id="fileupload" type="file" name="file">
        </form>
        <div class="plus">+</div>
        <div style="margin-top:3px;">
          上传图片
        </div>
        <div style="margin-top:6px;">
          （最多5张）
        </div>
      </div>
      <div style="clear:both"></div>
    </div>
  </div>
  <script type="text/javascript" src="/assets/js/utils/jquery.ui.widget.js"></script>
  <script type="text/javascript" src="/assets/js/utils/jquery.iframe-transport.js"></script>
  <script type="text/javascript" src="/assets/js/utils/jquery.fileupload.js"></script>
  <script type="text/javascript" src="/assets/js/dispute/evaluate.js"></script>
{% endblock %}
