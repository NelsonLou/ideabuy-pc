{% extends '../common/layouts/layout.swig' %}
{% block head %}
  <title>{{ title }}</title>
  <link rel="stylesheet" href="/assets/css/submit_order.css">
{% endblock %}
{% block content %}
  <div class="header-line"></div>
  <div class="submit-order-body">
    <div class="crumb clearfix w">
      <div class="item">手机</div>
      <div class="item seq"> > </div>
      <div class="item">4G手机</div>
      <div class="item seq"> > </div>
      <div class="item">苹果（Apple）</div>
      <div class="item seq"> > </div>
      <div class="item">iPhone 7 32G</div>
      <div class="item seq"> > </div>
      <div class="item">手机支付</div>
    </div>
    <div class="order-info w clearfix">
      <div class="o-i-title clearfix">
        收货人信息
        <span class="add-address"><i class="icon-plus"></i>新增收货地址</span>
      </div>
      <div class="address-list">
        {% for val in data.content.address_list %}
          <div id="{{val.address_id}}" class="addr-item clearfix">
            {% if val.default %}
            <input type="radio" name="address" value="{{val.address_id}}" checked="checked" class="addr-radio default-addr">
            {% else %}
            <input type="radio" name="address" value="{{val.address_id}}" class=“addr-radio”>
            {% endif %}
            <span class="addr-content">
              <span class="addr-text">{{val.consignee}}</span>
              <span class+"addr-text">{{val.province_name}} {{val.city_name}} {{val.district_name}} {{val.address}}</span>
              <span class="addr-text">{{val.mobile}}</span>
            </span>
            <span class="edit-addr">
              {% if !val.default %}
              <span class="btn set-btn">设为默认地址</span>
              {% endif %}
              <span class="btn edit-btn">编辑</span>
              <span class="btn delete-btn">删除</span>
            </span>
          </div>
        {% endfor %}
      </div>
      {% if data.content.address_list.length !== 0 %}
        <div class="show-addr-list"><span>收起地址</span><i class="arrow arrow-up"></i></div>
      {% endif %}
      <div class="summary-line" style="margin:16px 0;"></div>
      <div class="o-i-title">物流配送</div>
      <div class="delivery-row">
        <span class="d-r-label" for="logistics">物流公司</span>
        <input class="d-r-input" id="logistics" name="logistics" type="text" value="不限物流">
        <span class="d-r-select-icon"></span>
        <ul id="selectLogistics" class="d-r-select-box">
          {% for val in data.content.shipping_name_list %}
            <li>{{ val }}</li>
          {% endfor %}
        </ul>
      </div>
      <div class="delivery-row">
        <span class="d-r-label">配送时间</span>
        <span class="d-select delivery-time">
          {% for val in data.content.shipping_time_list %}
            <span class="select-opt" shippingTime="{{ val }}">{{ val }}<span class="icon-selected-rb"></span></span>
          {% endfor %}
        </span>
      </div>
      <div class="summary-line" style="margin:16px 0;"></div>
      <div class="o-i-title">发票信息</div>
      <div class="delivery-row">
        <span id="needInvoice"></span>
        <span class="invoice-text">我要开发票</span>
      </div>
      <div class="summary-line" style="margin:16px 0;"></div>
      <div class="o-i-title">支付方式</div>
      <div class="delivery-row">
        <span class="d-r-label">白条分期</span>
        <span class="d-select divide">
          {% for val in data.content.white_list %}
            <span class="select-opt" typeName="{{ val.type_name }}" divide="true">￥ {{ val.monthly_total_fee }}x{{ val.type_name }} 期<span class="icon-selected-rb"></span></span>
          {% endfor %}
          <span class="select-opt" typeName="0" divide="false">不分期<span class="icon-selected-rb"></span></span>
        </span>
      </div>
      <div class="d-r-pay">
        <span class="d-r-label">支付方式</span>
        <span class="d-pay-select">
          {% for key,val in data.content.pay_list %}
            <span id="payId{{ key }}" class="d-pay-item">
              <input type="radio" name="payWay" value="{{ key }}" class="d-radio">
              {% if key === '1' %}
                <i class="icon-ideabuy"></i>
              {% elseif key === '2' %}
                <i class="icon-alipay"></i>
              {% elseif key === '3' %}
                <i class="icon-wechat"></i>
              {% endif %}
              <tt class="d-text">{{ val }}支付</tt>
            </span>
          {% endfor %}
        </span>
      </div>
      <div class="summary-line" style="margin:16px 0;"></div>
      <div class="o-i-title">商品信息</div>
      <div class="goods-list clearfix">
        {% for store in data.content.store_list %}
          <div class="shop-item" adminId="{{store.admin_id}}">
            <div class="shop-header">
              <div class="col col-1"><span class="store-name">{{store.admin_nick}}</span>商品信息</div>
              <div class="col col-2">属性</div>
              <div class="col col-3">单价（元）</div>
              <div class="col col-4">数量</div>
              <div class="col col-5">小计（元）</div>
            </div>
            {% for goods in store.goods_list %}
              <div class="goods-item" goodsId="{{goods.goods_id}}" prodId="{{goods.product_id}}" goodsNum="{{goods.goods_number}}">
                <div class="col col-1 border-right">
                  <span class="goods-img"><a href="/mall/goods-detail?goods_id={{goods.goods_id}}"><img src="{{goods.goods_thumb}}"></a></span>
                  <span class="goods-info">
                    <span class="g-name"><a href="/mall/goods-detail?goods_id={{goods.goods_id}}">{{goods.goods_name}}</a></span>
                    <span class="g-tag">支持7天无理由退货</span>
                  </span>
                </div>
                <div class="col col-2 border-right">
                  {% for attr in goods.goods_attr %}
                    <span class="attr-item">{{attr.attr_name}}：{{attr.attr_value}}</span>
                  {% endfor %}
                </div>
                <div class="col col-3 border-right">
                  <span class="price-item line-thr">￥{{goods.market_price}}</span>
                  <span class="price-item">￥{{goods.product_price}}</span>
                </div>
                <div class="col col-4 border-right">
                  <span>{{goods.goods_number}}</span>
                </div>
                <div class="col col-5">
                  <span>￥{{(goods.product_price * goods.goods_number).toFixed(2)}}</span>
                </div>
              </div>
            {% endfor %}
            <div class="shop-footer">
              {# <span class="carriage-free">免运费</span> #}
              <span class="store-price">服务费：<span class="money">￥{{store.service_amount}}</span></span>
              <span class="store-price">运费：<span class="money">￥{{store.freight_amount}}</span></span>
              <span class="store-price">店铺合计（不含运费）：<span class="money">￥{{store.goods_amount}}</span></span>
            </div>
          </div>
        {% endfor %}
      </div>
    </div>
    <div class="amount-price">
      <div class="a-p-row">
        <span class="a-p-label">商品金额：</span>
        <span class="a-p-value">￥{{ data.content.total.total_goods_amount }}</span>
      </div>
      <div class="a-p-row">
        <span class="a-p-label">运费：</span>
        <span class="a-p-value">￥{{ data.content.total.total_freight_amount}}</span>
      </div>
      <div class="a-p-row">
        <span class="a-p-label">服务费：</span>
        <span class="a-p-value">￥{{ data.content.total.total_service_amount }}</span>
      </div>
    </div>
    <div class="confirm-box">
      <div class="a-p-row">
        <span class="a-p-label">应付总额：</span>
        <span class="a-p-value pay-count">￥{{ data.content.total.total_order_amount }}</span>
      </div>
      <div class="address-row">
        寄送至：
        <span class="total_address"></span>
      </div>
      <div class="receiver-row">
        收货人：
        <span class="total_consignee"></span>
      </div>
    </div>
    <div class="d-submit">
      <button type="button" id="submitPay" name="submitPay" class="submit-pay">提交并支付</button>
    </div>

    <div class="s-o-layer"></div>
    <div class="s-o-overlay">
      <div class="s-o-invoice-window">
        <p class="s-o-win-title">电子发票信息<span id="iClose" class="s-o-win-close"></span></p>
        <div class="invoice-body">
          <div class="i-row">
            <span class="i-label">发票类型</span>
            <span class="i-value">电子普通发票</span>
          </div>
          <div class="i-tips">电子普通发票是税局认可的有效凭证，其法律效力基本用途及使用规定同纸质发票</div>
          <div class="i-row">
            <span class="i-label">发票抬头</span>
            <span class="i-select">
              <span class="select-opt o-selected" iType="1">个人<span class="icon-selected-rb" style="display:block"></span></span>
              <span class="select-opt" iType="2">单位<span class="icon-selected-rb"></span></span>
            </span>
          </div>
          <div class="i-row personal-info">
            <span class="i-label">发票抬头</span>
            <input type="text" id="iTitle" name="iTitle" value="" class="i-username" placeholder="请输入个人姓名">
          </div>
          <div class="i-row company-info" style="display:none">
            <span class="i-label">纳税人识别号</span>
            <input type="text" id="iCode" name="iCode" value="" class="i-username" placeholder="统一社会信用代码">
          </div>
          <div class="i-row">
            <span class="i-label">发票内容</span>
            <span class="i-value">电子产品</span>
          </div>
        </div>
        <div class="invoice-desc">
          <p class="i-title">发票须知</p>
          <p class="i-text">1.开票金额为用户实际支付的金额；</p>
          <p class="i-text">2.电子发票可在确认收货后，在‘订单详情’或‘我的发票’下载；</p>
          <p class="i-text">3.未随箱包寄出的纸质发票会在发货后15-30个工作日单独寄出；</p>
          <p class="i-text">4.单笔订单只支持开具一种类型的发票，如需增值专用发票请联系客服处理</p>
        </div>
        <div class="i-btn-group">
          <button type="button" id="iSave" name="iSave" class="btn btn-save">保存</button>
          <button type="button" id="iCancel" name="iCancel" class="btn btn-cancel">取消</button>
        </div>
      </div>
      <div class="s-o-address-window">
        <p class="s-o-win-title"><span class="addr-title">编辑收货人信息</span><span id="aClose" class="s-o-win-close"></span></p>
        <div class="a-body">
          <div class="a-row">
            <span class="a-label"><i>* </i>收货人</span>
            <input type="text" id="aUsername" name="aUsername" value="" class="a-input" placeholder="请输入收件人姓名">
          </div>
          <div class="a-row">
            <span class="a-label"><i>* </i>联系人手机</span>
            <input type="text" id="aPhone" name="aPhone" value="" class="a-input" placeholder="请输入联系人手机号码">
          </div>
          <div class="a-row" id="distpicker">
            <span class="a-label"><i>* </i>所在地区</span>
            <select class="dist-picker" id="province" name="province"></select>
            <select class="dist-picker" id="city" name="city"></select>
            <select class="dist-picker" id="district" name="district"></select>
          </div>
          <div class="a-row">
            <span class="a-label"><i>* </i>详细地址</span>
            <textarea type="textarea" id="aAddress" name="aAddress" value="" class="a-textarea" placeholder="请输入详细地址"></textarea>
          </div>
        </div>
        <div class="a-footer">
          <button type="button" id="aSave" addrId="" userId="" name="aSave" class="btn-save">保存收货人信息</button>
        </div>
      </div>
    </div>
    <div class="my-alert-box">
      <span class="alert-icon"></span>
      <span class="alert-text"></span>
    </div>
    <div class="ideapay-module">
      <div class="i-m-header">
        <span class="i-m-title">支付确认</span>
        <span class="i-m-close"></span>
      </div>
      <div class="i-m-content">请输入支付密码</div>
      <div class="i-m-pwd" tabindex="0">
        <span class="active" style="margin-left: 0"><b></b></span>
        <span><b></b></span>
        <span><b></b></span>
        <span><b></b></span>
        <span><b></b></span>
        <span><b></b></span>
        <i class="shadow" style="left:0px;"></i>
      </div>
      <div class="i-m-tips">
        <span class="valid-text"><em class="icon-info"></em>支付密码输入错误</span>
        <span class="forget">忘记密码？</span>
      </div>
      <button type="button" class="i-m-submit">确认</button>
    </div>
  </div>

  <script src="/assets/utils/distpicker.data.js"></script>
  <script src="/assets/utils/distpicker.js"></script>
  <script src="/assets/js/mall/submit_order.js" charset="utf-8"></script>
{% endblock %}
