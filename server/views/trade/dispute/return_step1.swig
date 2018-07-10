{% extends '../../common/layouts/layout_user.swig' %}
{% block head %}
  <title>{{ title }}</title>
  <link rel="stylesheet" href="/assets/css/return_step1.css">
  <link rel="stylesheet" href="/assets/css/hot_production.css">
{% endblock %}
{% block content %}
  <div class="return-container">
    <div class="title">
      退货/退款
    </div>
    <div class="tab-group">
      <div class="tab actived">
        <div class="tab-content">
          <div class="circle">
            1
          </div>
          <span class="text">
            买家申请退款
          </span>
        </div>
      </div>
      <div class="tab">
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
    <div class="tab-group-1 hidden">
      <div class="tab actived" style="width:25%;">
        <div class="tab-content">
          <div class="circle">
            1
          </div>
          <span class="text">
            买家申请退款
          </span>
        </div>
      </div>
      <div class="tab" style="width:25%;">
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
    <div class="form">
      <div class="form-cell">
        <div class="form-cell-left">
          服务类型
        </div>
        <div class="form-cell-right">
          <div class="radio-cell">
            <input type="radio" name="serve_type" value="1" checked="checked">
            <span style="margin-left:14px;">我要退款（无需退货）</span>
          </div>
          <div class="radio-cell">
            <input type="radio" name="serve_type" value="2">
            <span style="margin-left:14px;">我要退货</span>
          </div>
        </div>
      </div>
      <div class="form-cell hidden">
        <div class="form-cell-left">
          收货状态
        </div>
        <div class="form-cell-right">
          <div class="radio-cell">
            <input type="radio" name="status" value="1" checked="checked">
            <span style="margin-left:14px;">未收到货</span>
          </div>
          <div class="radio-cell">
            <input type="radio" name="status" value="2">
            <span style="margin-left:14px;">已收到货</span>
          </div>
        </div>
      </div>
      <div class="form-cell">
        <div class="form-cell-left required">
          退款原因
        </div>
        <div class="form-cell-right">
          <select class="my-select" datatype="*" errormsg="* 不能为空">
            <option value="">请选择</option>
            <option value="1">原因1</option>
            <option value="2">原因2</option>
          </select>
          <span class="text-error"></span>
        </div>
      </div>
      <div class="form-cell">
        <div class="form-cell-left required">
          退款金额
        </div>
        <div class="form-cell-right">
          <span style="position:absolute;top:7px;left:195px;">￥</span>
          <input type="text" class="my-input" value="398" id="return-money-input" style="padding-left:20px;">
          <span style="color:red;"></span>
          <div class="tip">
            最多￥<span id="max-return-money">398.00</span>，含发货运费￥0.00
          </div>
        </div>
      </div>
      <div class="form-cell">
        <div class="form-cell-left required">
          退款说明
        </div>
        <div class="form-cell-right">
          <textarea rows="8" cols="80" style="padding:5px 10px;width:421px;resize: none;" datatype="*" nullmsg="* 不能为空"></textarea>
          <span class="text-error" style="top:140px;"></span>
        </div>
      </div>
      <div class="form-cell">
        <div class="form-cell-left">
          上传图片
        </div>
        <div class="form-cell-right">
          <div class="upload-img-container"></div>
          <div id="myupload" class="my-upload">
            <form action="/upload" method="post">
              <input id="fileupload" type="file" name="file">
            </form>
            <div class="plus">+</div>
            <div style="margin-top:3px;">
              上传凭证
            </div>
            <div style="margin-top:6px;">
              （最多3张）
            </div>
          </div>
        </div>
      </div>
      <div class="form-cell">
        <div class="form-cell-right">
          <div class="submit-btn">
            提交
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
  <script src="https://cdn.bootcss.com/jquery-ajaxtransport-xdomainrequest/1.0.4/jquery.xdomainrequest.min.js"></script>
  <script type="text/javascript" src="/assets/js/utils/validform.js"></script>
  <script type="text/javascript" src="/assets/js/dispute/return_step1.js"></script>
  <script src="/assets/js/dispute/hot_production.js"></script>
{% endblock %}
