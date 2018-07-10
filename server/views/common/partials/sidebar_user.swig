<link rel="stylesheet" href="/assets/css/sidebar_user.css">
{# 面包屑导航 #}
<div class="userCenterNavbar"></div>
{# 左边导航列表 #}
<div class="left_option">
  <div class="user_info">
    <div class="user_img">
      <img src="{{ user_info.user_portrait }}" alt="">
    </div>
    <div class="UI-mask"></div>
    <span>{{ user_info.user_mobile }}</span>
    <a href="/auth/logout">退出登录</a>
  </div>
  <div class="option_list">
    <ul>
      {% set linker = [{ "linkName": "个人信息", "link": "/account/profile" }, { "linkName": "我的订单", "link": "/trade/order/lists" }, { "linkName": "发票管理", "link": "/invoice/invoice-manage" }, { "linkName": "我的白条", "link": "/ious/my-ious" }, { "linkName": "银行卡管理", "link": "/account/bank-manage" }, { "linkName": "地址管理", "link": "/account/delivery-address" }, { "linkName": "账号安全", "link": "/security/index" }, { "linkName": "我的消息", "link": "/message/index" }] %}
      {% for key, val in linker %}
        <li {% if user_nav_cur == val.link %} class="OPlist_style" {% endif %}>
          <a href=" {{val.link}} ">
            <span>{{val.linkName}}</span>
            <i></i>
          </a>
        </li>
      {% endfor %}
    </ul>
  </div>
</div>
