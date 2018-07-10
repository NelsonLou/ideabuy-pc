{% extends './common/layouts/layout.swig' %}
{% block head %}
  <title>畅想购商城首页</title>
  <link rel="stylesheet" href="/assets/css/index.css">
{% endblock %}
{% block content %}
  {# banner #}

  <div class="index-banner">
    <div class="index-menu common-clearfloat">
      {# 左边导航栏 #}
      <div class="index-menu-left common-left">
        <ul>
          {% for key, val in menu %}
            {% if key < 6 %}
              <li class="li-part common-clearfloat">
                <div class="common-right"></div>
                <div class="common-left">
                  <a href="/mall/goods-list?brand_id={{val.cat_id}}" class="index-menuTitle">{{ val.cat_name }}</a>
                  <span class="index-menuTiny">
                    {% if val.children.length >= 2 %}
                      <a href="/mall/goods-list?brand_id={{val.children[0].cat_id}}">{{ val.children[0].cat_name }}</a>
                      <a href="/mall/goods-list?brand_id={{val.children[1].cat_id}}">{{ val.children[1].cat_name }}</a>
                    {% else %}
                      {% for keyx, valx in val.children %}
                        <a href="/mall/goods-list?brand_id={{ valx.cat_id }}">{{ valx.cat_name }}</a>
                      {% endfor %}
                    {% endif %}
                  </span>
                </div>
                <div class="index-menuhidden hidden{{key}}">
                  <div class="index-hidden-top">
                    <span>{{val.cat_name }}</span>
                  </div>
                  <div class="index-hidden-cent">
                    <ul class="common-clearfloat">
                      {% for keyA, valA in val.children %}
                        <li>
                          <a href="/mall/goods-list?brand_id={{valA.cat_id}}">{{ valA.cat_name }}</a>
                        </li>
                      {% endfor %}
                    </ul>
                  </div>
                  <div class="index-hidden-bottom common-clearfloat">
                    {% for keyB, valB in val.children %}
                      {% if keyB < 3 %}
                        <div class="index-hidden-goods goodsA">
                          <img class="index-hidden-goodsImg" src="{{ valB.cat_thumb }}"></img>
                          <span class="index-hidden-goodsNM">{{valB.cat_name}}</span>
                          <span class="index-hidden-goodsPR">￥2000</span>
                          <a class="index-hidden-single" href="/mall/goods-detail?goods_id={{ valB.cat_id }}"></a>
                        </div>
                      {% else %}
                        <div class=""></div>
                      {% endif %}
                    {% endfor %}
                  </div>
                </div>
              </li>
            {% else %}
            {% endif %}
          {% endfor %}
        </ul>
      </div>
      {# 右边登录栏 #}
      <div class="index-menu-right not-login common-right">
        {# 用户部分 #}
        <div class="index-menu-user">
          {% if user_info %}
            <div class="user-logo not-login-logo common-left common-clearfloat" style="background-image: url({{ user_info.user_portrait }});background-position:center; background-size:100% 100%;"></div>
          {% else %}
            <div class="user-logo not-login-logo common-left common-clearfloat"></div>
          {% endif %}

          <div class="common-left index-menu-userbtn">
            {% if user_info %}
              <div>Hi，{{ user_info.user_mobile }}</div>
            {% else %}
              <div>Hi，欢迎来到畅想购</div>
            {% endif %}
            {% if user_info && ious.user_status.status === 2 %}
              <span class="index-menu-Ylogin">
                <span>信用分<i class="ious-levelnum">{{ious.credit_point}}</i>
                </span>
                <span class="ious-level">良好</span>
              </span>
            {% else %}
              <span class="index-menu-Nlogin common-show">
                {% if !user_info %}
                  <span>
                    <a class="loginBtn" href="/member/login">登录</a>
                  </span>
                {% endif %}
                <span class="partB-C">
                  {% if ious.user_status.status === 3 %}
                    <a href="/ious/identification">立即激活</a>
                  {% else %}
                    {% if ious.user_status.is_idcard !== 1%}
                      <a href="/ious/identification">立即激活</a>
                    {% elseif ious.user_status.is_idcard_img !== 1 %}
                      <a href="/ious/upload-idcard">立即激活</a>
                    {% endif %}
                  {% endif %}
                </span>
              </span>
            {% endif %}
          </div>
        </div>
        {# 白条部分 #}
        {% if !user_info || ious.user_status.status !== 2 %}
          <div class="index-menu-white common-show">
            <div class="partA">激活沃白条即享</div>
            <div class="partB">
              <span>5000</span>元额度</div>
            <div class="partC"></div>
            <div class="partD">
              {% if ious.user_status.status === 3 %}
                <a href="/ious/identification">立即激活</a>
              {% else %}
                {% if ious.user_status.is_idcard !== 1%}
                  <a href="/ious/identification">立即激活</a>
                {% elseif ious.user_status.is_idcard_img !== 1 %}
                  <a href="/ious/upload-idcard">立即激活</a>
                {% endif %}
              {% endif %}
            </div>
          </div>
        {% endif %}

        {% if user_info && ious.user_status.status === 2 %}
          <div class="index-menu-whiteB common-show">
            <div class="partA">
              <ul class="common-clearfloat">
                <li class="common-left">
                  <span>
                    <i>{{ious.residual_data}}</i>元</span>
                  <span>剩余话费</span>
                </li>
                <li class="common-left">
                  <span>
                    <i>{{ious.residual_data}}</i>MB</span>
                  <span>剩余流量</span>
                </li>
                <li class="common-left">
                  <span>
                    <i>{{ious.real_time_charge}}</i>分钟</span>
                  <span>剩余语音</span>
                </li>
              </ul>
            </div>
            <div class="partB">
              <span class="partB-A">白条可用额度</span>
              <span class="partB-B">
                <i class="ious-amount">{{ious.white_amount}}</i>
                <i class="ious-txt">元</i>
              </span>
              <span class="partB-C">
                <a href="/ious/my-ious">立即还款</a>
              </span>
            </div>
            <div class="partC"></div>
          </div>
        {% endif %}
      </div>
      {# 中间切换键 #}
      <div class="index-menu-switch">
        <ul class="index-menu-switchbox common-clearfloat">
          <li class="index-switch quiet menuBgA active"></li>
          {# <li class="index-switch quiet menuBgA"></li>
        <li class="index-switch quiet menuBgA"></li>
        <li class="index-switch quiet menuBgA"></li>
        <li class="index-switch quiet menuBgA"></li> #}
        </ul>
      </div>
    </div>
  </div>
</div>
<div class="index-main">
  <div class="main-container">
    <div class="goods-top">
      <ul>
        <li><img src="/assets/images/index/1051@2x.png" alt=""></li>
        <li><img src="/assets/images/index/1055@2x.png" alt=""></li>
        <li><img src="/assets/images/index/1052@2x.png" alt=""></li>
        <li><img src="/assets/images/index/1054@2x.png" alt=""></li>
      </ul>
    </div>
    {# 列表标题 #}
    <div class="goods-list">
      <div class="list-title">
        <div class="title-left">
          <span class="phone-icon"></span>
          <a>
            零元购机
          </a>
        </div>
        <div class="title-right">
          <div class="title-rightL">
            <ul>
              <li>
                <a href="#">
                  苹果
                </a>
                <span>/</span>
              </li>
              <li>
                <a href="#">
                  三星
                </a>
                <span>/</span>
              </li>
              <li>
                <a href="#">
                  华为
                </a>
                <span>/</span>
              </li>
              <li>
                <a href="#">
                  小米
                </a>
                <span>/</span>
              </li>
              <li>
                <a href="#">
                  OPPO
                </a>
                <span>/</span>
              </li>
              <li>
                <a href="#">
                  VIVO
                </a>
                <span>/</span>
              </li>
              <li>
                <a href="#">
                  金立
                </a>
                <span>/</span>
              </li>
              <li>
                <a href="#">
                  中兴
                </a>
                <span>/</span>
              </li>
              <li>
                <a href="#">
                  乐视
                </a>
                <span>/</span>
              </li>
              <li>
                <a href="#">
                  魅族
                </a>
              </li>
            </ul>
          </div>
          <div class="title-rightR">
            <a href="/mall/goods-list">
              查看更多>>
            </a>
          </div>
        </div>
      </div>
    </div>
    {# 列表详情 #}
    <div class="goods-detail">
      <div class="detail-left">
        <img src="/assets/images/index/03.jpg" alt="">
      </div>
      <div class="detail-right">
        <div class="">
          <ul>
            <li class="detail-style">
              <img src="/assets/images/index/06.jpg" alt="">
              <p>
                <span>乐2</span>
                <a>直降200</a>
                <i>￥<em>899</em>起</i>
              </p>
            </li>
            <li>
              <img src="/assets/images/index/06-03.jpg" alt="">
              <p>
                <span>VIVO X9S PLUS</span>
                <a></a>
                <i>￥<em>199.83</em>起</i>
                <b>×<small>12</small>期</b>
              </p>
            </li>
            <li>
              <img src="/assets/images/index/08.jpg" alt="">
              <p>
                <span>IPHONE7</span>
                <a></a>
                <i>￥<em>199.83</em>起</i>
                <b>×<small>12</small>期</b>
              </p>
            </li>
            <section class="clear-float"></section>
          </ul>
          <section class="clear-float"></section>
        </div>
        <div class="">
          <ul>
            <li>
              <img src="/assets/images/index/13.jpg" alt="">
              <p>
                <span>坚果手机PRO</span>
                <a></a>
                <i>￥<em>199.83</em>起</i>
                <b>×<small>12</small>期</b>
              </p>
            </li>
            <li>
              <img src="/assets/images/index/13-07.jpg" alt="">
              <p>
                <span>一加手机3T</span>
                <a></a>
                <i>￥<em>199.83</em>起</i>
                <b>×<small>12</small>期</b>
              </p>
            </li>
            <li class="detail-style">
              <img src="/assets/images/index/16.jpg" alt="">
              <p>
                <span>乐S3 爵迹版</span>
                <a>含一年乐次元影视会员</a>
                <i>￥<em>899</em>起</i>
              </p>
            </li>
            <section class="clear-float"></section>
          </ul>
          <section class="clear-float"></section>
        </div>
        <section class="clear-float"></section>
      </div>
      <section class="clear-float"></section>
    </div>
  </div>

  <script src="/assets/js/index/index.js"></script>
{% endblock %}
