{% extends '../common/layouts/layout_user.swig' %}
{% block head %}
  <title>{{ title }}</title>
  <link rel="stylesheet" href="/assets/css/add_address.css">
  <link rel="stylesheet" href="/assets/css/validform.css">
  <link rel="stylesheet" href="/assets/css/city-picker.css">
{% endblock %}
{% block content %}

  <div class="add-address-box">
    <div class="add-address-header">
      <span>{{ title }}</span>
    </div>
    <div class="add-address">
      <div class="title">请添加您的收获地址</div>
      <form class="form delivery-address" id="distpicker" action="add-address" method="post">
        <input type="hidden" id="address_id" name="address_id" value="{{data.data.address_info.address_id}}">
        <input type="hidden" id="province_name" value="{{data.data.address_info.province_name}}">
        <input type="hidden" id="city_name" value="{{data.data.address_info.city_name}}">
        <input type="hidden" id="district_name" value="{{data.data.address_info.district_name}}">
        <div class="location">
          <label class="full" for="city" style="position: static;">所在地区</label>
          <select class="form-control" id="province" name="province"></select>
          <select class="form-control" id="city" name="city"></select>
          <select class="form-control" id="district" name="district"></select>
        </div>
        <div class="address">
          <label for="address">详细地址</label>
          <input type="text" name="address" id="address" placeholder="请输入详细地址、街道、门牌号等" datatype="*" nullmsg="* 详细地址不能为空" value="{{data.data.address_info.address}}">
          <span class="text-error" style="left:71px;bottom:-20px"></span>
        </div>
        <div class="consignee">
          <label for="consignee">收货人</label>
          <input type="text" name="consignee" id="consignee" placeholder="请输入收货人姓名" datatype="xm" nullmsg="* 姓名不能为空" errormsg="* 格式错误" value="{{data.data.address_info.consignee}}">
          <span class="text-error" style="left:71px;bottom:-20px"></span>
        </div>
        <div class="mobile">
          <label for="mobile">联系电话</label>
          <input type="text" name="mobile" id="mobile" placeholder="请输入收货人手机号" datatype="m" nullmsg="* 联系电话不能为空" errormsg="* 格式错误" value="{{data.data.address_info.mobile}}">
          <span class="text-error" style="left:71px;bottom:-20px"></span>
        </div>
        <br>
        <br>
        {# <div class="set-default">
          <input type="checkbox" name="set-default" id="set-default">
          <label for="set-default">设为默认地址</label>
        </div> #}
        <button type="reset" style="display:none;">重置</button>
        <button type="button" class="cancel">取消</button>
        <button type="submit" class="confirm">确定</button>
      </form>
    </div>
  </div>
  <script src="/assets/utils/distpicker.data.js"></script>
  <script src="/assets/utils/distpicker.js"></script>
  <script src="/assets/js/utils/validform.js"></script>
  <script src="/assets/js/account/add_address.js"></script>
{% endblock %}
