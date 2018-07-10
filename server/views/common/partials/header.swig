<link rel="stylesheet" href="/assets/css/header.css">
<div class="header">
  <div class="header-topBar">
    <div class="header-topMain common-clearfloat">
      <ul class="header-top-ulL common-clearfloat">
        <li class="header-location common-left">
          <span class="common-left"></span>
          <span>当前定位：</span>
          <a class="header-location-txt" href="#"></a>
        </li>
        <li class="common-left">
          <div class="header-top-notlogin common-show">
            {% if user_info %}
              <a href="/account/profile">
                <span style="color: #666">{{ user_info.user_mobile }}</spana>
              </a>
            {% else %}
              <a href="/member/login">亲，请登录</a>
            {% endif %}
            &nbsp
            <span>|</span>
            &nbsp
            {% if user_info %}
              <a href="/auth/logout">退出登录</a>
            {% else %}
              <a href="/member/register">免费注册</a>
            {% endif %}
          </div>
          <div class="header-top-notlogin common-display"></div>
        </li>
      </ul>
      <ul class="header-top-ulR common-clearfloat">
        {% set linker = [ { "linkName": "我的订单", "link": "/trade/order/lists" }, { "linkName": "我的白条", "link": "/ious/my-ious" },{ "linkName": "我的消息", "link": "/message/index" }] %}
        {% for key, val in linker %}
          <li class="header-top-ulRli common-left">
            {% if key === 1 %}
              {% if ious.user_status.status === 2 %}
                <a href="{{val.link}}">{{val.linkName}}</a>
              {% elseif ious.user_status.status === 3 %}
                <a href="/ious/identification">{{val.linkName}}</a>
              {% else %}
                {% if ious.user_status.is_idcard !== 1%}
                  <a href="/ious/identification">我的白条</a>
                {% elseif ious.user_status.is_idcard_img !== 1 %}
                  <a href="/ious/upload-idcard">我的白条</a>
                {% endif %}
              {% endif %}
            {% else %}
              <a href="{{val.link}}">{{val.linkName}}</a>
            {% endif %}
          </li>
        {% endfor %}
        {# <li class="header-top-ulRli common-left">
          <a href="#">自助服务</a>
        </li> #}
        <li class="header-top-ulRli custome-help common-clearfloat common-left">
          <span class="custome-help-txt">客户服务</span>
          {# 客户服务下拉框 #}
          <div class="custome-help-down common-display">
            <ul>
              <li>
                <span>
                  <a href="帮助中心"></a>
                </span>
              </li>
              <li>
                <span>客服电话</span>
              </li>
              <li>
                <span>在线客服</span>
              </li>
              <li>
                <span>商务合作</span>
              </li>
            </ul>
          </div>
        </li>
        <li class="header-top-ulRli phoneApp common-clearfloat common-left">
          <span>手机畅想购</span>
          {# 二维码下拉框 #}
          <div class="mobile-qr common-display common-clearfloat">
            <div class="mobile-qr-imgone common-left">
              <span class="mobile-qr-imgA"></span>
              <span>畅想购APP</span>
            </div>
            <div class="mobile-qr-imgtwo common-right">
              <span class="mobile-qr-imgB"></span>
              <span>畅想购公众号</span>
            </div>
          </div>
        </li>
      </ul>
    </div>
  </div>
  <div class="header-navbar common-clearfloat">
    <span class="header-logo common-left">
      <a href="/"></a>
    </span>
    <ul class="header-navbar-main common-left">
      {% set linkerA = [ { "linkName": "首页", "link": "/" }, { "linkName": "我的白条", "link": "/ious/my-ious" }, { "linkName": "4G手机", "link": "/mall/goods-list" } ] %}
      {% for key, val in linkerA %}
        <li class="header-navbar-part">
          {% if key === 1 %}
            {% if ious.user_status.status === 2 %}
              <a href="{{val.link}}">{{val.linkName}}</a>
            {% elseif ious.user_status.status === 3 %}
              <a href="/ious/identification">{{val.linkName}}</a>
            {% else %}
              {% if ious.user_status.is_idcard !== 1%}
                <a href="/ious/identification">我的白条</a>
              {% elseif ious.user_status.is_idcard_img !== 1 %}
                <a href="/ious/upload-idcard">我的白条</a>
              {% endif %}
            {% endif %}
          {% else %}
            <a href="{{val.link}}">{{val.linkName}}</a>
          {% endif %}
        </li>
      {% endfor %}
    </ul>
    {# 搜索栏 #}
    <div class="header-search common-right common-clearfloat">
      <input class="header-search-input" type="text" name="" value="">
      <span class="common-right">
        <a href="#"></a>
      </span>
    </div>
  </div>
</div>
