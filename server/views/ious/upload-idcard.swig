{% extends '../common/layouts/layout.swig' %}
{% block head %}
<title>{{ title }}</title>
<link rel="stylesheet" href="/assets/css/upload_idcard.css">
{% endblock %}
{% block header %}
  {% include '../common/partials/header_user.swig' %}
{% endblock header %}
{% block sidebar %}
{% endblock sidebar %}
{% block content %}
  <div class="act-body">
    <div class="act-content">
      <div class="act-form">
        <div class="act-form-row">
          <div class="act-form-item act-item-fir">
            <div id="myuploadOne" class="my-upload">
              <form action="/upload" method="post">
                <input id="fileuploadOne" type="file" name="file" accept="image/gif,image/jpeg,image/jpg,image/png">
              </form>
              <p class="act-form-info">请上传您的身份证正面照</p>
              <span class="act-form-icon"></span>
            </div>
            <div class="upload-img-container show-img-one"></div>
          </div>
          <div class="act-form-item">
            <div id="myuploadTwo" class="my-upload">
              <form action="/upload" method="post">
                <input id="fileuploadTwo" type="file" name="file" accept="image/gif,image/jpeg,image/jpg,image/png">
              </form>
              <p class="act-form-info">请上传您的身份证背面照</p>
              <span class="act-form-icon"></span>
            </div>
            <div class="upload-img-container show-img-two"></div>
          </div>
          <div class="act-form-item">
            <div id="myuploadThree" class="my-upload">
              <form action="/upload" method="post">
                <input id="fileuploadThree" type="file" name="file" accept="image/gif,image/jpeg,image/jpg,image/png">
              </form>
              <p class="act-form-info">请上传您的手持身份证正面照</p>
              <span class="act-form-icon"></span>
            </div>
            <div class="upload-img-container show-img-three"></div>
          </div>
        </div>
        <p class="act-tips">您的身份证照片仅用于分期认证，提交后不可修改</p>
        <div id="formSubmit" class="act-btn-submit">下一步</div>
      </div>
    </div>
    <div class="act-disc">
      <div class="act-disc-title">拍照说明：<span class="act-disc-help">合格照片示例图</span></div>
      <div class="act-disc-detail">
        <p class="act-disc-detail-item">1.所拍身份证必须是本人的</p>
        <p class="act-disc-detail-item">2.整个画面必须字迹清晰</p>
        <p class="act-disc-detail-item">3.照片上不允许带日期且照片不能PS</p>
        <p class="act-disc-detail-item">4.照片规格：800*600像素</p>
        <p class="act-disc-detail-item">5.手持身份证，只拍上半身</p>
        <p class="act-disc-detail-item">6.因授信额度直接受身份认证影响，建议您尽量按要求上传照片</p>
        <p class="act-disc-detail-item">7.您的身份证仅用于分期认证，提交后不可修改</p>
      </div>
    </div>
    <div class="act-layer"></div>
    <div class="act-overlay">
      <div class="act-overlay-window">
        <p class="act-overlay-title">身份证示意图<span class="act-overlay-close"></span></p>
        <div class="act-overlay-row">
          <span class="act-overlay-item">
            <span class="act-overlay-item-span">
              <span class="act-overlay-item-img idcard-front"></span>
            </span>
            <span class="act-overlay-item-text">身份证正面照</span>
          </span>
          <span class="act-overlay-item">
            <span class="act-overlay-item-span">
              <span class="act-overlay-item-img idcard-reverse"></span>
            </span>
            <span class="act-overlay-item-text">身份证反面照</span>
          </span>
        </div>
        <div class="act-overlay-row">
          <span class="act-overlay-item">
            <span class="act-overlay-item-span">
              <span class="act-overlay-item-img idcard-inhand"></span>
            </span>
            <span class="act-overlay-item-text">身份证手持正面照</span>
          </span>
        </div>
      </div>
    </div>
    <div class="act-res-layer"></div>
    <div class="act-res-overlay">
      <div class="act-overlay-window-fail">
        <p class="act-overlay-window-top"><span id="resClose" class="act-overlay-close"></span></p>
        <div class="act-overlay-window-icon"></div>
        <p class="act-overlay-window-msg"></p>
        <div id="resAllright" class="act-overlay-window-btn">我知道了</div>
      </div>
    </div>
  </div>

  <script type="text/javascript" src="/assets/js/utils/jquery.ui.widget.js"></script>
  <script type="text/javascript" src="/assets/js/utils/jquery.iframe-transport.js"></script>
  <script type="text/javascript" src="/assets/js/utils/jquery.fileupload.js"></script>
  <script src="https://cdn.bootcss.com/jquery-ajaxtransport-xdomainrequest/1.0.4/jquery.xdomainrequest.min.js"></script>
  <script src="/assets/js/ious/upload_idcard.js"></script>
{% endblock %}
