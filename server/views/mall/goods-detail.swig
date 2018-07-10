{% extends '../common/layouts/layout.swig' %}
{% block head %}
  <title>{{ title }}</title>
  <link rel="stylesheet" href="/assets/css/goods_detail.css">
{% endblock %}
{% block content %}
  <div class="header-line"></div>
  <div class="goods-detail-body">
    <div class="crumb clearfix w">
      <div class="item">手机</div>
      <div class="item seq">
        >
      </div>
      <div class="item">4G手机</div>
      <div class="item seq">
        >
      </div>
      <div class="item">苹果（Apple）iPhone 7 32G</div>
    </div>
    <div class="product-intro clearfix w">
      <div class="preview-wrap">
        <div id="vertical" class="bigImg">
          {% for val in data.content.goods_detail.goods_img %}
            {% if loop.index === 1 %}
              <img src="{{ val }}" width="450" height="450" alt="" id="midimg"/>
            {% else %}
              <img src="{{ val }}" width="450" height="450" alt=""/>
            {% endif %}
          {% endfor %}
          {# <img src="/assets/images/goodsDetail/large01.png" width="450" height="450" alt="" id="midimg" />
          <img src="/assets/images/goodsDetail/large02.png" width="450" height="450" alt=""/>
          <img src="/assets/images/goodsDetail/large03.png" width="450" height="450" alt=""/>
          <img src="/assets/images/goodsDetail/large04.png" width="450" height="450" alt=""/>
          <img src="/assets/images/goodsDetail/large05.png" width="450" height="450" alt=""/>
          <img src="/assets/images/goodsDetail/large06.png" width="450" height="450" alt=""/> #}
          <div style="display:none;" id="winSelector"></div>
        </div>
        <div class="smallImg">
          <div class="scrollbutton smallImgUp disabled">
            <span class="arrow-prev"></span>
          </div>
          <div id="imageMenu">
            <ul>
              {% for val in data.content.goods_detail.goods_thumb %}
                {% if loop.index === 1 %}
                  <li id="onlickImg"><img src="{{ val }}" width="68" height="68" alt=""/></li>
                {% else %}
                  <li><img src="{{ val }}" width="68" height="68" alt=""/></li>
                {% endif %}
              {% endfor %}
              {# <li id="onlickImg"><img src="/assets/images/goodsDetail/small01.png" width="68" height="68" alt=""/></li>
      				<li><img src="/assets/images/goodsDetail/small02.png" width="68" height="68" alt=""/></li>
      				<li><img src="/assets/images/goodsDetail/small03.png" width="68" height="68" alt=""/></li>
      				<li><img src="/assets/images/goodsDetail/small04.png" width="68" height="68" alt=""/></li>
      				<li><img src="/assets/images/goodsDetail/small05.png" width="68" height="68" alt=""/></li>
      				<li><img src="/assets/images/goodsDetail/small06.png" width="68" height="68" alt=""/></li> #}
            </ul>
          </div>
          <div class="scrollbutton smallImgDown">
            <span class="arrow-next"></span>
          </div>
        </div>
        <div id="bigView" style="display:none;"><img width="900" height="900" alt="" src=""/></div>
      </div>
      <div class="itemInfo-wrap">
        <div
          id="goodsObj"
          goodsid="{{ data.content.goods_detail.goods_id }}"
          productid="{{ data.content.goods_detail.product_id }}"
          adminid="{{ data.content.goods_detail.admin_id }}"
          goodssn="{{ data.content.goods_detail.goods_sn }}"
          goodsthumb="{{ data.content.goods_detail.goods_thumb[0] }}"
          goodsimg="{{ data.content.goods_detail.goods_img[0] }}"
          style="display:none;"></div>
        <div id="goodsName" class="goods-name">{{ data.content.goods_detail.goods_name }}</div>
        <div class="goods-news">
          {# {{ data.content.goods_detail.goods_desc }} #}
        </div>
        <div class="goods-price-wrap">
          <div class="goods-price">
            <div class="goods-info-label">
              <tt class="w2">价格</tt>
            </div>
            <div class="goods-price-val">￥<tt class="rmb-val">{{ data.content.goods_detail.goods_price }}</tt>
            </div>
          </div>
          <div class="goods-stock">
            <div class="goods-info-label">
              <tt class="w2">库存</tt>
            </div>
            <span id="goodsNum" class="goods-stock-val">{{ data.content.goods_detail.goods_number }}</span>
          </div>
          <div class="goods-evaluate">
            <div class="goods-info-label">商品评价</div>
            <span class="goods-ev-star">
              {% set star = [1, 1, 1, 1, 1] %}
              {% set star.length = data.content.goods_detail.comment_star %}
              {% for key, val in star %}
                <i class="icon-star"></i>
              {% endfor %}
            </span>
            <div class="evaluate-count">
              <span class="e-c-label">累计评价：</span>
              <span class="e-c-value">{{ data.content.goods_detail.comment_number }}</span>
            </div>
          </div>
        </div>
        <div class="buy-form clearfix">
          <div class="tips-without-attr">选择您要的商品信息<i class="close-buy-tips"></i>
          </div>
          <div class="summary-line" style=""></div>
          <div class="delivery-area">
            <span class="dl-a-icon"></span>
            <span class="dl-a-label">派送范围</span>
            <span class="dl-a-val">{{ data.content.goods_detail.shipping_range_name }}</span>
          </div>
          <div class="choose-attrs-group">
            {% for val in data.content.goods_detail.options %}
              <div class="choose-attr">
                <div class="goods-info-label">
                  {% set labSize = val.attr_name.length %}
                  {% if labSize == 2 %}
                    <tt class="w2">{{ val.attr_name }}</tt>
                  {% elseif labSize == 3 %}
                    <tt class="w3">{{ val.attr_name }}</tt>
                  {% elseif labSize == 4 %}
                    <tt>{{ val.attr_name }}</tt>
                  {% endif %}
                </div>
                <div class="choose-item-wrap">
                  {% for item in val.attr_values %}
                    {% if item.selected %}
                      <span id="{{ item.attr_id }}" isselected="{{ item.selected }}" class="choose-item attr-selected" clickable="{{ item.status }}">
                        {{ item.attr_value }}
                        {# {{ item.attr_id }} #}
                        <span class="icon-selected-rb" style="display:block"></span>
                      </span>
                    {% else %}
                      <span id="{{ item.attr_id }}" isselected="{{ item.selected }}" class="choose-item choose-{{ item.status }}" clickable="{{ item.status }}">
                        {{ item.attr_value }}
                        {# {{ item.attr_id }} #}
                        <span class="icon-selected-rb"></span>
                      </span>
                    {% endif %}
                  {% endfor %}
                </div>
              </div>
            {% endfor %}
          </div>
          <div class="summary-line"></div>
          <div class="selected-summary">
            <div class="s-label">已选内容：&nbsp;&nbsp;&nbsp;</div>
            <div class="s-text">
              "
              {% for key, val in data.content.goods_detail.options %}
                <span class="selected-attr s-attr{{ key }}">
                  {% for tag in data.content.goods_detail.options[key].attr_values %}
                    {% if tag.selected %}
                      {{ tag.attr_value }}
                    {% endif %}
                  {% endfor %}
                </span>
                {% if key < data.content.goods_detail.options.length - 1 %}
                  <span>
                    /
                  </span>
                {% endif %}
              {% endfor %}
              "
            </div>
          </div>
          <div class="buy-btn-group">
            <div class="choose-quantity">
              <input type="text" id="quantity" value="1" class="input-quantity">
              <button type="button" id="addQuantity" name="addQuantity" class="btn-quantity btn-add">+</button>
              <button type="button" id="subQuantity" name="subQuantity" class="btn-quantity btn-sub">-</button>
            </div>
            <button type="button" id="buyItNow" name="buyItNow" class="buy-it-now">立即购买</button>
            <button type="button" id="addToCart" name="addToCart" class="add-to-cart">
              <i class="icon-shopcar"></i>加入购物车</button>
          </div>
        </div>
      </div>
    </div>
    <div class="w clearfix" style="margin-top: 30px;">
      <div class="aside-wrap">
        <div class="supplier-info">
          <div class="s-i-header">
            供应商信息
          </div>
          <div class="s-i-info">
            <div class="s-i-d1">
              <div class="s-i-d1-sp">
                <div class="s-i-icon icon1"></div>
                <div class="s-i-msg">正品保证</div>
              </div>
              <div class="s-i-d1-sp">
                <div class="s-i-icon icon2"></div>
                <div class="s-i-msg">提供发票</div>
              </div>
              <div class="s-i-d1-sp s-i-sp-last">
                <div class="s-i-icon icon3"></div>
                <div class="s-i-msg">全场包邮</div>
              </div>
            </div>
            <div class="summary-line" style="height: 1px;"></div>
            <div class="s-i-row">
              <span class="s-i-label">供应商：</span>
              <span class="s-i-value" style="color: #e3101e">{{ data.content.supplier_info.admin_nick }}</span>
            </div>
            <div class="s-i-row">
              <span class="s-i-label">所在地：</span>
              <span class="s-i-value">{{ data.content.supplier_info.city }}</span>
            </div>
            <div class="s-i-row">
              <span class="s-i-label">联系电话：</span>
              <span class="s-i-value" style="color: #e3101e">{{ data.content.supplier_info.admin_mobile }}</span>
            </div>
            <div class="s-i-service">在线导购</div>
          </div>
        </div>
        <div class="aside-list">
          <div class="as-header">同类商品推荐</div>
          <div class="as-list-body">
            {% set asList = [1, 1, 1] %}
            {% for key, val in data.content.goods_left.goods_left_type %}
              <div class="as-item">
                <a class="as-item-name" href="/mall/goods-detail?goods_id={{ val.goods_id }}"><img class="as-item-img" src="{{ val.goods_thumb }}" alt=""></a>
                <a class="as-item-name" href="/mall/goods-detail?goods_id={{ val.goods_id }}">{{ val.goods_name }}</a>
                <div class="as-item-price">￥{{ val.goods_price }}</div>
              </div>
              {% if loop.index < data.content.goods_left.goods_left_type.length %}
                <div class="summary-line" style="height:1px;"></div>
              {% endif %}
            {% endfor %}
          </div>
        </div>
        <div class="aside-list">
          <div class="as-header">热卖商品</div>
          <div class="as-list-body">
            {% set asList = [1, 1, 1] %}
            {% for key, val in data.content.goods_left.goods_left_sales %}
              <div class="as-item">
                <a class="as-item-name" href="/mall/goods-detail?goods_id={{ val.goods_id }}"><img class="as-item-img" src="{{ val.goods_thumb }}" alt=""></a>
                <a class="as-item-name" href="/mall/goods-detail?goods_id={{ val.goods_id }}">{{ val.goods_name }}</a>
                <div class="as-item-price">￥{{ val.goods_price }}</div>
              </div>
              {% if loop.index < data.content.goods_left.goods_left_sales.length %}
                <div class="summary-line" style="height:1px;"></div>
              {% endif %}
            {% endfor %}
          </div>
        </div>
        <div class="aside-list">
          <div class="as-header">浏览历史</div>
          <div class="as-list-body">
            {% set asList = [1, 1, 1] %}
            {% for key, val in data.content.goods_left.goods_left_history %}
              <div class="as-item">
                <a class="as-item-name" href="/mall/goods-detail?goods_id={{ val.goods_id }}"><img class="as-item-img" src="{{ val.goods_thumb }}" alt=""></a>
                <a class="as-item-name" href="/mall/goods-detail?goods_id={{ val.goods_id }}">{{ val.goods_name }}</a>
                <div class="as-item-price">￥{{ val.goods_price }}</div>
              </div>
              {% if loop.index < data.content.goods_left.goods_left_history.length %}
                <div class="summary-line" style="height:1px;"></div>
              {% endif %}
            {% endfor %}
          </div>
        </div>
      </div>
      <div class="detail-wrap">
        <div class="dt-tabbar">
          <ul class="dt-tabbar-ul">
            <li class="dt-tabbar-li dt-tabbar-selected">
              <a href="#mainPage0">商品详情</a>
            </li>
            <li class="dt-tabbar-li">
              <a href="#mainPage1">手机参数</a>
            </li>
            <li class="dt-tabbar-li">
              <a href="#mainPage2">合约套餐</a>
            </li>
            <li id="goodsEvaluate" class="dt-tabbar-li">
              <a href="#mainPage3">商品评价</a>
            </li>
          </ul>
        </div>
        <div class="tabbar-box"></div>
        <div class="main-wrap">
          <div id="mainPage0" class="main-page0">
            <div class="gs-dt-info">
              {{ data.content.goods_detail.goods_desc }}
              {% set infoLabel = [
                '单卡 / 双卡双待',
                '屏幕尺寸',
                'CPU',
                '摄像头',
                'sim卡类型',
                '操作系统',
                '分辨率',
                '机身内存ROM'
              ] %}
              {% for key, val in data.content.goods_info.goods_detail.main_info %}
                <div class="info-item">
                  <div class="item-icon info-icon{{loop.index}}"></div>
                  <div class="item-label">{{ infoLabel[loop.index0] }}</div>
                  <div class="item-value">{{ val }}</div>
                </div>
              {% endfor %}
            </div>
            <div class="gs-dt-banner">
              <img src="{{ data.content.goods_info.goods_detail.banner_img }}" alt="">
            </div>
            <div class="gs-dt-box">
              <img src="{{ data.content.goods_info.goods_detail.ad_img }}" alt="">
            </div>
          </div>
          <div id="mainPage1" class="main-page1">手机参数</div>
          <div id="mainPage2" class="main-page2">合约套餐</div>
          <div id="mainPage3" class="main-page3">
            <div class="comment-header">
              <div class="favorable-rate">
                <div class="f-r-label">
                  好评率
                </div>
                <div class="f-r-value">
                  <span class="f-r-num">98</span>
                  <span class="f-r-symbol">%</span>
                </div>
              </div>
              <div class="users-tag">
                <div class="tag-item">
                  <span class="item-label">性价比高</span>
                  <span class="item-value">965</span>
                </div>
              </div>
            </div>
            <div class="comment-tab">
              <div class="tab-item item-active">
                全部评价（66666）
              </div>
              <div class="tab-item">
                好评（66666）
              </div>
              <div class="tab-item">
                中评（66666）
              </div>
              <div class="tab-item">
                差评（66666）
              </div>
              <div class="tab-item">
                追评（66666）
              </div>
              <div class="tab-item">
                晒图（66666）
              </div>
            </div>
            <div class="comment-body">
              <div class="comment-item">
                <div class="user-info">
                  <div class="user-img"><img src="/assets/images/goodsDetail/small02.png" width="40" height="40" alt="iphone7"/></div>
                  <div class="user-name">1***5</div>
                  <div class="user-score">725 分</div>
                </div>
                <div class="user-review">
                  <div class="rev-stars">
                    <i class="icon-star"></i>
                    <i class="icon-star"></i>
                    <i class="icon-star"></i>
                  </div>
                  <div class="rev-datetime">2017-10-29 10:10:23</div>
                  <div class="rev-attrs">
                    <div class="attr-item">
                      <span class="item-lab">所选套餐：</span>
                      <span class="item-val">6 + 64G</span>
                    </div>
                  </div>
                  <div class="rev-content">
                    评论内容评论内容评论内容评论内容评论内容评论内容评论内容评论内容评论内容评论内容评论内容评论内容评论内容评论内容 评论内容评论内容评论内容评论内容评论内容评论内容评论内容评论内容评论内容评论内容评论内容评论内容评论内容评论内容 评论内容评论内容评论内容评论内容评论内容评论内容评论内容评论内容评论内容评论内容评论内容评论内容评论内容评论内容
                  </div>
                  <div class="rev-imgs">
                    <ul class="img-list">
                      <li><img src="/assets/images/goodsDetail/small02.png" width="50" height="50" alt="iphone7"/></li>
                      <li><img src="/assets/images/goodsDetail/small03.png" width="50" height="50" alt="iphone7"/></li>
                      <li><img src="/assets/images/goodsDetail/small04.png" width="50" height="50" alt="iphone7"/></li>
                      <li><img src="/assets/images/goodsDetail/small05.png" width="50" height="50" alt="iphone7"/></li>
                      <li><img src="/assets/images/goodsDetail/small06.png" width="50" height="50" alt="iphone7"/></li>
                      <li><img src="/assets/images/goodsDetail/small01.png" width="50" height="50" alt="iphone7"/></li>
                    </ul>
                  </div>
                  <div class="summary-line" style="height: 1px;"></div>
                  <div class="extra-comment-label">购买7天后追评</div>
                  <div class="extra-comment-content">厉害了，一点问题都没有！</div>
                  <div class="res-repay">
                    <div class="repay-from">中国联通官方客服</div>
                    <div class="repay-content">您好，感谢支持</div>
                    <div class="repay-datetime">2017-10-29</div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>

  <script src="/assets/js/mall/goods_detail.js" charset="utf-8"></script>
{% endblock %}
