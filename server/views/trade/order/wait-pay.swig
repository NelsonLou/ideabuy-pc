{% extends '../../common/layouts/layout_user.swig' %}
{% block head %}
  <title>{{ title }}</title>
  <link rel="stylesheet" href="/assets/css/lists.css">
{% endblock %}
{% block content %}
  {# 右边内容 #}
  <div class="right-content">
    {# 右边导航 #}
    <div class="RCont-option">
      <ul>
        <li>
          <a href="/trade/order/lists">
            <span>全部</span></a>
        </li>
        <li>
          <a href="/trade/order/wait-pay?status=dfk">
            <span class="rigOp-sty">待付款</span></a>
        </li>
        <li>
          <a href="/trade/order/lists?status=dfh">
            <span>待发货</span></a>
        </li>
        <li>
          <a href="/trade/order/lists?status=dsh">
            <span>待收货</span></a>
        </li>
        <li>
          <a href="/trade/order/lists?status=dpj">
            <span>待评价</span></a>
        </li>
        {# <li><a href=""><span>退款售后</span></a></li> #}
      </ul>
    </div>
    {# 内容列表 #}
    <div class="cont-list">
      {# 内容列表标题 #}
      <div class="contList-title">
        <ul>
          <li class="CT-baby">宝贝</li>
          <li class="CT-pric">单价</li>
          <li class="CT-true">实付款</li>
          <li class="CT-state">交易状态</li>
          <li class="CT-active">交易操作</li>
        </ul>
      </div>
      {# 内容列表内容 #}
      {% for list_info in data.data.order_list %}
        {% if list_info.order_status == 0 %}
          <div class="contList-cont">
            <p class="cont-top">
              <span class="order-time">2017-03-05 15:06:30</span>
              <span>
                <a href="/trade/order/detail?order_sn={{list_info.order_sn}}">订单编号 :
                  {{list_info.order_sn}}</a>
              </span>
              <span>和我联系<i></i>
              </span>
            </p>
            <table class="cont-table">
              {% for goods_detail in list_info.goods_info %}
                {% if loop.index == 1 %}
                  <tr>
                    <td class="goods-info">
                      <a href="/trade/order/detail?order_sn={{list_info.order_sn}}">
                        <img src="{{goods_detail.goods_thumb}}" alt="">
                        <div class="goods-detail">
                          <h5 class="goods-name">{{goods_detail.goods_name}}
                            <strong class="goods-num">×{{goods_detail.goods_number}}</strong>
                          </h5>
                          <p>
                            <span>属性:<a>{{goods_detail.str_attr}}</a></span></p>
                        </div>
                      </a>
                    </td>
                    <td class="pice-td">
                      <i class="goods-Origprice">￥<em>{{goods_detail.market_price}}</em>
                      </i>
                      <i class="after-fold">￥<em>{{goods_detail.product_price}}</em>
                      </i>
                    </td>
                    {% if list_info.goods_info.length < 2 %}
                      <td class="goods-total">
                        <i class="final-price">￥<em>{{goods_detail.goods_amount}}</em>
                        </i>
                        <i class="goods-freight">（含运费 :
                          <em>{{goods_detail.freight_amount}}</em>）</i>
                      </td>
                      <td class="goods-status">
                        <i>未付款</i>
                        <i class="order-detail">
                          <a href="/trade/order/detail?order_sn={{list_info.order_sn}}">订单详情</a>
                        </i>
                      </td>
                      <td class="goods-operation">
                        <i class="immedia-pay">
                          <b style="display: none;">{{list_info.order_sn}}</b>立即付款</i>
                        <i class="cancel-order">取消订单</i>
                      </td>
                    {% else %}
                      <td class="goods-total" rowspan="{{list_info.goods_info.length}}">
                        <i class="final-price">￥<em>{{goods_detail.goods_amount}}</em>
                        </i>
                        <i class="goods-freight">（含运费 :
                          <em>{{goods_detail.freight_amount}}</em>）</i>
                      </td>
                      <td class="goods-status" rowspan="{{list_info.goods_info.length}}">
                        <i>未付款</i>
                        <i class="order-detail">
                          <a href="/trade/order/detail?order_sn={{list_info.order_sn}}">订单详情</a>
                        </i>
                      </td>
                      <td class="goods-operation" rowspan="{{list_info.goods_info.length}}">
                        <i class="immedia-pay">
                          <b style="display: none;">{{list_info.order_sn}}</b>立即付款</i>
                        <i class="cancel-order">取消订单</i>
                      </td>
                    {% endif %}
                  </tr>
                {% else %}
                  <tr>
                    <td class="goods-info">
                      <a href="/trade/order/detail?order_sn={{list_info.order_sn}}">
                        <img src="{{goods_detail.goods_thumb}}" alt="">
                        <div class="goods-detail">
                          <h5 class="goods-name">{{goods_detail.goods_name}}
                            <strong class="goods-num">×{{goods_detail.goods_number}}</strong>
                          </h5>
                          <p>
                            <span>属性:<a>{{goods_detail.str_attr}}</a></span></p>
                        </div>
                      </a>
                    </td>
                    <td class="pice-td">
                      <i class="goods-Origprice">￥<em>{{goods_detail.market_price}}</em>
                      </i>
                      <i class="after-fold">￥<em>{{goods_detail.product_price}}</em>
                      </i>
                    </td>
                  </tr>
                {% endif %}
              {% endfor %}
            </table>
          </div>
        {% endif %}
      {% endfor %}
      <div class="page_box">
        <div class="total-num">{{data.data.total}}</div>
        <div class="page-num" style="display: none;">{{para.page}}</div>
        <div id="page" class="page_div"></div>
      </div>
    </div>
  </div>
  <section class="clear-float"></section>

  <script type="text/javascript" src="/assets/js/goods/paging.js"></script>
  <script type="text/javascript" src="/assets/js/order/lists.js"></script>
{% endblock %}
