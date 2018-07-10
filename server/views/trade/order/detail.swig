{% extends '../../common/layouts/layout_user.swig' %}
{% block head %}
  <title>{{ title }}</title>
  <link rel="stylesheet" href="/assets/css/wait_pay.css">
{% endblock %}
{% block content %}
  {# 右边内容 #}
  <div class="right-content">
    {% if data.data.order_info.order_status == 0 %}
      <div class="payment-info">
        <p class="goods-payment">
          <span class="payment">等待买家付款</span>
          <em class="payment-time"></em>29分59秒</p>
        <p class="pay-prompt">后系统自动取消订单,请抓紧时间<span class="payment-btn">付款</span>哦!</p>
        <p class="order-operat">如果您不想购买,可以<span class="operat">取消订单</span></p>
      </div>
    {% elseif data.data.order_info.order_status == 1 %}
      <div class="payment-info">
        <p class="goods-payment">
          <span class="payment">等待卖家发货</span></p>
        <p class="order-operat">如果您不想购买,可以<span class="operat">申请退款</span></p>
      </div>
    {% elseif data.data.order_info.order_status == 2 %}
      <div class="payment-info">
        <p class="goods-payment">
          <span class="payment">卖家已发货</span></p>
        <p class="order-operat">如果您不想购买,可以<span class="operat">申请退款</span></p>
      </div>
    {% elseif data.data.order_info.order_status == 3 %}
      <div class="payment-info">
        <p class="goods-payment">
          <span class="payment" style="color: #333;">交易成功</span></p>
        <p class="order-operat">交易成功,请给卖家<span class="operat">评价</span></p>
      </div>
    {% elseif data.data.order_info.order_status == 4 %}
      <div class="payment-info">
        <p class="goods-payment">
          <span class="payment" style="color: #999;">交易关闭</span></p>
        <p class="order-operat">交易类型：买家关闭订单</p>
      </div>
    {% endif %}
    {% if data.data.order_info.order_status == 0 %}
      <div class="logistics-info" style="display: none;">
      {% elseif data.data.order_info.order_status == 1 %}
        <div class="logistics-info" style="display: none;">
        {% elseif data.data.order_info.order_status == 2 %}
          <div class="logistics-info">
          {% elseif data.data.order_info.order_status == 3 %}
            <div class="logistics-info">
            {% elseif data.data.order_info.order_status == 4 %}
              <div class="logistics-info" style="display: none;">
              {% endif %}
              <div class="logistics-title">
                <p>物流信息</p>
              </div>
              <div class="logistics-detail">
                <div class="">
                  <span>发货方式 :
                  </span>
                  <a>快递</a>
                </div>
                <div class="">
                  <span>物流公司 :
                  </span>
                  <a>顺丰快递</a>
                </div>
                <div class="">
                  <span>运单号码 :
                  </span>
                  <a>3336278558877</a>
                </div>
                <div class="">
                  <span>物流跟踪 :
                  </span>
                  <ul>
                    <li>2017-08-17 11:21:33 您的订单已被顺丰快递揽收</li>
                    <li>2017-08-17 11:21:33 您的快递已到达XXX营业点，快递将很快进行派件</li>
                    <li>2017-08-17 11:21:33 XXX营业点营业员李四（联系电话：<b>15297726101</b>）正在派件，请保持电话通畅</li>
                    <li>2017-08-18 11:21:33 快递已签收</li>
                  </ul>
                </div>
              </div>
            </div>
            <div class="order-info">
              <div class="info-title">
                订单信息
                <p>
                  <a class="IT-serve" href="#">
                    <em class="order-info-sever"></em>
                    客服
                  </a>
                  <a class="IT-phone" href="#">
                    <em class="order-info-phone"></em>
                    致电10010
                  </a>
                </p>
              </div>
              <div class="info-detail">
                <table class="ID-table">
                  <tr>
                    <th>订单编号</th>
                    <th>创建时间</th>
                    <th>收货地址</th>
                  </tr>
                  <tr>
                    <td>{{data.data.order_info.order_sn}}</td>
                    <td>{{data.data.order_info.created_at}}</td>
                    <td>{{data.data.order_info.consignee}},{{data.data.order_info.mobile}}
                      {{data.data.order_info.province}}{{data.data.order_info.city}}{{data.data.order_info.district}}{{data.data.order_info.address}}{{data.data.order_info.street}}</td>
                  </tr>
                </table>
              </div>
              <div class="info-goods">
                <table class="IG-table">
                  <tr>
                    <th class="IG-td">商品</th>
                    <th>属性</th>
                    <th>数量</th>
                    <th>单价</th>
                    <th>优惠</th>
                    <th>付款方式</th>
                    <th>订单总金额</th>
                  </tr>
                  {% for goods_list in data.data.order_info.goods_info %}
                    <tr class="IG-tr">
                      <td class="IG-td">
                        <a style="width: 100%;height: 100%;display: block;" href="/mall/goods-detail?goods_id={{goods_list.goods_id}}"><img src="{{goods_list.goods_thumb}}" alt="">
                          <span>{{goods_list.goods_name}}</span></a>
                      </td>
                      <td>{{goods_list.str_attr}}</td>
                      <td>{{goods_list.goods_number}}</td>
                      <td>￥{{data.data.order_info.goods_amount}}</td>
                      <td>/</td>
                      {% if data.data.order_info.order_status == 0 %}
                        <td>/</td>
                      {% elseif data.data.order_info.order_status == 1 %}
                        {% if data.data.order_info.pay_id == 1 %}
                          <td>白条</td>
                        {% elseif data.data.order_info.pay_id == 2 %}
                          <td>支付宝</td>
                        {% elseif data.data.order_info.pay_id == 3 %}
                          <td>微信</td>
                        {% elseif data.data.order_info.pay_id == 4 %}
                          <td>银行卡</td>
                        {% elseif data.data.order_info.pay_id == 5 %}
                          <td>余额</td>
                        {% endif %}
                      {% elseif data.data.order_info.order_status == 2 %}
                        {% if data.data.order_info.pay_id == 1 %}
                          <td>白条</td>
                        {% elseif data.data.order_info.pay_id == 2 %}
                          <td>支付宝</td>
                        {% elseif data.data.order_info.pay_id == 3 %}
                          <td>微信</td>
                        {% elseif data.data.order_info.pay_id == 4 %}
                          <td>银行卡</td>
                        {% elseif data.data.order_info.pay_id == 5 %}
                          <td>余额</td>
                        {% endif %}
                      {% elseif data.data.order_info.order_status == 3 %}
                        {% if data.data.order_info.pay_id == 1 %}
                          <td>白条</td>
                        {% elseif data.data.order_info.pay_id == 2 %}
                          <td>支付宝</td>
                        {% elseif data.data.order_info.pay_id == 3 %}
                          <td>微信</td>
                        {% elseif data.data.order_info.pay_id == 4 %}
                          <td>银行卡</td>
                        {% elseif data.data.order_info.pay_id == 5 %}
                          <td>余额</td>
                        {% endif %}
                      {% elseif data.data.order_info.order_status == 4 %}
                        <td>/</td>
                      {% endif %}
                      <td class="td-color">￥{{data.data.order_info.order_amount}}</td>
                    </tr>
                  {% endfor %}
                </table>
              </div>
            </div>
            <div class="invoice-info">
              <div class="title-info">
                <p>发票信息</p>
              </div>
              <table class="II-table">
                <tr>
                  <th>发票抬头</th>
                  <th>发票类型</th>
                  <th>发票内容</th>
                  <th>操作</th>
                </tr>
                <tr>
                  <td>个人</td>
                  <td>个人</td>
                  <td>电子产品</td>
                  <td>
                    <a href="#">下载</a>
                  </td>
                </tr>
              </table>
            </div>
          </div>
          <section class="clear-float"></section>
        {% endblock %}
