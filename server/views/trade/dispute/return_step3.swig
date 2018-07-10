{% extends '../../common/layouts/layout_user.swig' %}
{% block head %}
  <title>{{ title }}</title>
  <link rel="stylesheet" href="/assets/css/return_consult.css">
  <link rel="stylesheet" href="/assets/css/return_layout.css">
  <link rel="stylesheet" href="/assets/css/return_step3.css">
  <link rel="stylesheet" href="/assets/css/return_detail.css">
  <link rel="stylesheet" href="/assets/css/hot_production.css">
{% endblock %}
{% block content %}
  <div class="return-container">
    <div class="title">
      退货/退款
    </div>
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
      <div class="tab actived" style="width:25%;">
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
    <div class="return-step2-container">
      <div class="step3-main">
        <div style="font-size:18px;color:#333;">
          请退货并填写物流信息
        </div>
        <div style="margin-top:27px;">
          <span style="color:#de0000;">6天23小时5分后</span>
          系统自动关闭退货申请
        </div>
        <div style="margin-top:22px;font-size:16px;">
          退货地址
        </div>
        <div style="margin-top:17px;">
          <span style="margin-right:20px;">收货人：xxx</span>
          <span>15869185979</span>
        </div>
        <div style="margin-top:10px;">
          收货地址：浙江省宁波市鄞州区XXXX联通营业厅
        </div>
        <div class="btn-group">
          <div class="btn-left">
            撤销申请
          </div>
          <div class="btn-right">
            填写物流单号
          </div>
        </div>
      </div>
      <div class="step3-form hidden">
        <div class="form-cell">
          <div class="form-cell-left required">
            物流公司
          </div>
          <div class="form-cell-right">
            <select class="my-select" datatype="*" errormsg="* 请选择物流公司">
              <option value="">请选择</option>
              <option value="1">顺丰快递</option>
              <option value="2">圆通快递</option>
            </select>
            <span class="text-error"></span>
          </div>
        </div>
        <div class="form-cell">
          <div class="form-cell-left required">
            物流单号
          </div>
          <div class="form-cell-right">
            <input type="text" class="my-input" placeholder="请填写物流单号" datatype="*" errormsg="* 请填写物流单号" nullmsg="* 请填写物流单号">
            <span class="text-error"></span>
          </div>
        </div>
        <div class="form-cell">
          <div class="form-cell-left required">
            联系电话
          </div>
          <div class="form-cell-right">
            <input type="text" class="my-input" placeholder="请填写联系电话" datatype="*" errormsg="* 请填写联系电话" nullmsg="* 请填写联系电话">
            <span class="text-error"></span>
          </div>
        </div>
        <div class="form-cell">
          <div class="form-cell-left">
            退货说明
          </div>
          <div class="form-cell-right">
            <textarea rows="8" cols="80" style="padding:5px 10px;width:421px;resize:none;"></textarea>
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
  <script type="text/javascript" src="/assets/js/utils/jquery.ui.widget.js"></script>
  <script type="text/javascript" src="/assets/js/utils/jquery.iframe-transport.js"></script>
  <script type="text/javascript" src="/assets/js/utils/jquery.fileupload.js"></script>
  <script src="https://cdn.bootcss.com/jquery-ajaxtransport-xdomainrequest/1.0.4/jquery.xdomainrequest.min.js"></script>
  <script type="text/javascript" src="/assets/js/utils/validform.js"></script>
  <script type="text/javascript" src="/assets/js/dispute/return_step3.js"></script>
  <script src="/assets/js/dispute/hot_production.js"></script>
{% endblock %}
