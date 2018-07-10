{% block sidebar %}{% endblock %}
{% block header %}
  {% include '../common/partials/header.swig' %}
{% endblock %}
{% extends '../common/layouts/layout.swig' %}
{% block head %}
  <title>{{ title }}</title>
  <link rel="stylesheet" href="/assets/css/cart.css">
{% endblock %}
{% block content %}
  <div class="" style="color:blue;font-size:20px;"></div>
  <div class="cart-box">
    <div class="cart common-w">
      {% if cart.length !== 0 %}
        <div class="cart-delivery-place">
          <span class="cart-delivery-placeTxt">配送至：</span>
          <select class="cart-delivery-select" name="">
            <option value="">浙江宁波鄞州区</option>
          </select>
        </div>
        <div class="cart-table-title">
          <ul class="common-clearfloat">
            <li class="cart-table-titleBox select-all"></li>
            <li class="cart-table-checkAll">全选</li>
            <li class="cart-table-info">商品信息</li>
            <li class="cart-table-attr">属性</li>
            <li class="cart-table-price">单价（元）</li>
            <li class="cart-table-num">数量</li>
            <li class="cart-table-amount">小计（元）</li>
            <li class="cart-table-act">操作</li>
          </ul>
        </div>
        <div class="cart-table-body">
        {% for key, val in cart %}
        <div class="store-item">
          <div class="cart-shop-title">
            <span class="cart-shop-checkBox select-store"></span>
            <span class="cart-shop-pic"></span>
            <span class="cart-shop-txt">{{val.admin_nick}}</span>
            <span class="cart-shop-connect"></span>
            <span class="cart-shop-coupons">优惠券<i class="coupons-open arrow-down"></i></span>
          </div>
          {% for keyA, valA in val.cart_list %}
            {% if keyA === val.cart_list.length - 1 %}
              <div class="cart-order-info" productId="{{valA.product_id}}" style="border-bottom: 1px solid #D2D2D2;">
            {% else %}
              <div class="cart-order-info" productId="{{valA.product_id}}">
            {% endif %}
                <ul class="common-clearfloat">
                  <li class="cart-order-select">
                    <span cartId="{{valA.cart_id}}" productPrice="{{valA.product_price}}" class="cart-goods-checkBox select-goods"></span>
                  </li>
                  <li class="cart-order-pic">
                    <a href="/mall/goods-detail?goods_id={{valA.goods_id}}"><img src="{{valA.goods_thumb}}" alt="" style="display:inline-block;width:100%;height:100%;"></a>
                  </li>
                  <li class="cart-order-name">
                    <span class="cart-order-nameTxt"><a href="/mall/goods-detail?goods_id={{valA.goods_id}}">{{valA.goods_name}}</a></span>
                    <span class="cart-order-support">支持7天无理由退货</span>
                  </li>
                  <li class="cart-order-attr">
                    {% for valAttr in valA.attr_list %}
                      <span>{{valAttr.attr_name}}：{{valAttr.attr_value}}</span>
                    {% endfor %}
                  </li>
                  <li class="cart-order-price">
                    <span class="market-price">￥{{valA.market_price}}</span>
                    <span class="cart-order-priceNow">￥<span style="display:inline-block">{{valA.product_price}}</span></span>
                  </li>
                  <li class="cart-order-num">
                    <span class="cart-order-numMain">
                      <span class="cart-order-numMainTxt">{{valA.goods_number}}</span>
                      <button class="cart-order-numSub">-</button>
                      <button class="cart-order-numAdd">+</button>
                    </span>
                  </li>
                  <li class="cart-order-amount">
                    <span>￥{{valA.product_price * valA.goods_number}}</span>
                  </li>
                  <li cartId="{{valA.cart_id}}" class="cart-order-act">删除</li>
                </ul>
              </div>
            {% endfor %}
            </div>
          {% endfor %}
          </div>
          <div class="cart-table-bottom common-clearfloat">
            <ul>
              <li class="cart-bottom-checkBox select-all"></li>
              <li class="cart-bottom-checkAll">全选</li>
              <li class="cart-bottom-delete">删除选中的物品</li>
              <li class="cart-bottom-clean">清空失效的宝贝</li>
              <li class="cart-bottom-choosen">已选择<span class="goods-num">0</span>件物品</li>
              <li class="cart-bottom-amount"><span>合计（不含运费）:</span><i>￥</i><i class="goods-amount">0</i>
              </li>
              <li class="cart-bottom-btn">
                <button type="button" id="confirmBuy" class="confirm-buy confirm-disabled">去结算</button>
              </li>
            </ul>
          </div>
          {% else %}
          <div class="cart-normal common-clearfloat">
            <div class="common-left cart-normal-img"></div>
            <div class="common-left cart-normal-txt">
              <span>购物车块饿憋了，主人快给我挑点宝贝吧</span>
              <a href="/"><button id="toIndex" type="button" name="button">马上去逛逛</button></a>
            </div>
          </div>
        {% endif %}
        <div class="goods_recom">
          <p class="recom_title">推荐商品</p>
          <div class="recom_list">
            <div class="recom_detail">
              <img src="/assets/images/image/phone_11.jpg" alt="">
              <p class="recom_pric">￥3599</p>
              <p class="recom_name">[iPhone6s Plus] 32G 玫瑰金 联通4G版</p>
            </div>
            <div class="recom_detail">
              <img src="/assets/images/image/phone_07.jpg" alt="">
              <p class="recom_pric">￥3599</p>
              <p class="recom_name">[iPhone6s Plus] 32G 玫瑰金 联通4G版</p>
            </div>
            <div class="recom_detail">
              <img src="/assets/images/image/phone_11.jpg" alt="">
              <p class="recom_pric">￥3599</p>
              <p class="recom_name">[iPhone6s Plus] 32G 玫瑰金 联通4G版</p>
            </div>
            <div class="recom_detail">
              <img src="/assets/images/image/phone_07.jpg" alt="">
              <p class="recom_pric">￥3599</p>
              <p class="recom_name">[iPhone6s Plus] 32G 玫瑰金 联通4G版</p>
            </div>
            <div class="recom_detail">
              <img src="/assets/images/image/phone_11.jpg" alt="">
              <p class="recom_pric">￥3599</p>
              <p class="recom_name">[iPhone6s Plus] 32G 玫瑰金 联通4G版</p>
            </div>
          </div>
        </div>
        <div class="goods_conduct">
          <img src="/assets/images/image/phone_15.jpg" alt="">
        </div>
      </div>
    </div>

    <script src="/assets/js/mall/cart.js" charset="utf-8"></script>
  {% endblock %}
