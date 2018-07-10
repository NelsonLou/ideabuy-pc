<link rel="stylesheet" href="/assets/css/header_user.css">
<div class="headerU">
  <div class="headerU-topBar">
    <div class="headerU-topMain common-clearfloat">
      <ul class="headerU-top-ulL common-clearfloat">
        <li class="headerU-location common-left">
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
      <ul class="headerU-top-ulR common-clearfloat">
        {% set linker = [ { "linkName": "我的订单", "link": "/trade/order/lists" }, { "linkName": "我的白条", "link": "/ious/my-ious" },{ "linkName": "我的消息", "link": "/message/index" } ] %}
        {% for key, val in linker %}
          <li class="headerU-top-ulRli common-left">
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
        {# <li class="headerU-top-ulRli common-left">自助服务</li> #}
        <li class="headerU-top-ulRli custome-help common-clearfloat common-left">
          <span>客户服务</span>
          <div class="custome-help-down common-display">
            <ul>
              <li>
                <span>帮助中心</span>
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
        <li class="headerU-top-ulRli phoneApp common-clearfloat common-left">
          <span>手机畅想购</span>
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
  <div class="headerU-navbar common-clearfloat">
    <span class="headerU-logo common-left">
      <a href="/"></a>
    </span>
    <span class="headerU-title">{{ title }}</span>
  </div>
</div>
