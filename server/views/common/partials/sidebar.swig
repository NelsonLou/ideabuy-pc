<link rel="stylesheet" href="/assets/css/sidebar.css">
<div class="sidebar">
  <div class="sidebar-person">
    <div class="sidebar-person-hidden sidebar-hidden">个人中心
      <span></span>
    </div>
    <a href="/account/profile"></a>
  </div>
  <div class="sidebar-shopcar-box">
    <div class="sidebar-shopcar">
      <span class="sidebar-shopcar-icon"></span>
      <span class="sidebar-shopcar-txt">购物车</span>
      <span class="sidebar-shopcar-num">0</span>
    </div>
  </div>
  <div class="sidebar-coupons">
    <div class="sidebar-coupons-hidden sidebar-hidden">优惠券
      <span></span>
    </div>
  </div>
  <div class="sidebar-qr">
    <div class="sidebar-qr-hidden sidebar-hidden">二维码
      <span></span>
    </div>
  </div>
  <div class="sidebar-share">
    <div class="sidebar-share-hidden sidebar-hidden">分享
      <span></span>
    </div>
  </div>
  <div class="sidebar-service">
    <div class="sidebar-service-hidden sidebar-hidden">联系客服
      <span></span>
    </div>
  </div>
  <div class="sidebar-shopcar-addBox">
    <div class="sidebar-shopcar-add common-display">
      <div class="sidebar-right-title common-clearfloat">
        <span class="common-left sidebar-right-logo"></span>
        <span class="common-left common-left-B">
          <span class="sidebar-right-txt">商品已成功加入购物车！</span>
          <span class="sidebar-right-goodsName">苹果（APPLE）iphone7/红色/32G</span>
        </span>
        <a class="common-right sidebar-right-button" href="/cart/list">去购物车结算</a>
      </div>
      {# <div class="sidebar-right-bottom">
        <div class="sidebar-right-bottomTxt">买了该商品的人还买了</div>
        <div class="sidebar-right-bottomImg">
          <span class="sidebar-bottom-btn"><</span> <span></span> <span></span> <span></span> <span></span> <span class="sidebar-bottom-btn">></span>
        </div>
      </div> #}
    </div>
  </div>
  <div class="sidebar-write">
    <div class="sidebar-write-hidden sidebar-hidden">反馈
      <span></span>
    </div>
  </div>
  <div class="sidebar-gotop">
    <div class="sidebar-gotop-hidden sidebar-hidden">回到头部
      <span></span>
    </div>
    <a href="javascript:scroll(0,0)"></a>
  </div>
</div>
{# 侧边展开栏 #}
<div class="sidebar-side-hidden common-display">
  <div class="sidebar-side-hTitle"></div>
  <span class="icon-close-circle"></span>
  <div class="sidebar-side-shopcar common-display">
    <div class="sidebar-shopcar-hList">
      <ul>
        {% for key, val in cart %}
          {% for keyA, valA in val.cart_list %}
            <li class="common-clearfloat cart-goods">
              <span class="common-left"><a href="/mall/goods-detail?goods_id={{valA.goods_id}}"><img src="{{valA.goods_thumb}}" width="90" height="90"></a></span>
              <span class="common-left">
                <span><a href="/mall/goods-detail?goods_id={{valA.goods_id}}">{{valA.goods_name}}</a></span>
                <span class="sidebar-shopcar-hListPri">
                  <i>{{valA.product_price}}</i>X<i>1</i>
                </span>
              </span>
            </li>
          {% endfor %}
        {% endfor %}
      </ul>
    </div>
    <div class="sidebar-shopcar-hBtn">
      <span>共<i class="goods-num">0</i>件商品</span>
      <a class="sidebar-shopcar-hGo" href="/cart/list">去购物车结算</a>
    </div>
  </div>
  <div class="sidebar-side-coupons common-display">
    <div class="sidebar-coupons-hList">
      <ul>
        <li class="common-clearfloat">
          <span class="common-left"></span>
          <span class="common-left">
            <span>苹果6s/苹果6s/苹果6s/苹果6s/苹果6s/苹果6s/苹果6s/苹果6s/</span>
            <span class="sidebar-coupons-hListPri">
              <i>￥4588.00</i>X<i>1</i>
            </span>
          </span>
        </li>
        <li class="common-clearfloat">
          <span class="common-left"></span>
          <span class="common-left">
            <span>苹果6s/苹果6s/苹果6s/苹果6s/苹果6s/苹果6s/苹果6s/苹果6s/</span>
            <span class="sidebar-coupons-hListPri">
              <i>￥4588.00</i>X<i>1</i>
            </span>
          </span>
        </li>
      </ul>
    </div>
    <div class="sidebar-coupons-hBtn">
      <button class="sidebar-coupons-hGo" type="button" name="button" onclick="javascript:window.location.href='account/coupon'">我的优惠券</button>
    </div>
  </div>
</div>
<script src="/assets/js/sidebar.js" charset="utf-8"></script>
