{% extends '../common/layouts/layout_user.swig' %}
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
        {% if para.status == "" %}
          <li>
            <a href="/invoice/invoice-manage?status=">
              <span class="rigOp-sty">发票列表</span></a>
          </li>
          <li>
            <a href="#">
              <span>月结发票</span></a>
          </li>
          <li>
            <a href="#">
              <span>实缴发票</span></a>
          </li>
          <li>
            <a href="#">
              <span>营业发票</span></a>
          </li>
          <li>
            <a href="/invoice/invoice-manage?status=1">
              <span class="">已开发票</span></a>
          </li>
          <li>
            <a href="/invoice/invoice-manage?status=0">
              <span class="">未开发票</span></a>
          </li>
          <li>
            <a href="#">
              <span>一卡充</span></a>
          </li>
        {% elseif para.status == 0 %}
          <li>
            <a href="/invoice/invoice-manage?status=">
              <span>发票列表</span></a>
          </li>
          <li>
            <a href="#">
              <span>月结发票</span></a>
          </li>
          <li>
            <a href="#">
              <span>实缴发票</span></a>
          </li>
          <li>
            <a href="#">
              <span>营业发票</span></a>
          </li>
          <li>
            <a href="/invoice/invoice-manage?status=1">
              <span class="">已开发票</span></a>
          </li>
          <li>
            <a href="/invoice/invoice-manage?status=0">
              <span class="rigOp-sty">未开发票</span></a>
          </li>
          <li>
            <a href="#">
              <span>一卡充</span></a>
          </li>
        {% elseif para.status == 1 %}
          <li>
            <a href="/invoice/invoice-manage?status=">
              <span>发票列表</span></a>
          </li>
          <li>
            <a href="#">
              <span>月结发票</span></a>
          </li>
          <li>
            <a href="#">
              <span>实缴发票</span></a>
          </li>
          <li>
            <a href="#">
              <span>营业发票</span></a>
          </li>
          <li>
            <a href="/invoice/invoice-manage?status=1">
              <span class="rigOp-sty">已开发票</span></a>
          </li>
          <li>
            <a href="/invoice/invoice-manage?status=0">
              <span class="">未开发票</span></a>
          </li>
          <li>
            <a href="#">
              <span>一卡充</span></a>
          </li>
        {% endif %}
      </ul>
    </div>
    {# 内容列表 #}
    <div class="cont-list">
      {# 内容列表标题 #}
      <div class="contList-title">
        <table>
          <tr>
            <td>订单详情</td>
            <td>发票类型</td>
            <td>状态</td>
            <td>操作</td>
          </tr>
        </table>
      </div>
      {# 内容列表内容 #}
      {% for infor_list in data.data.data.order_list %}
        <div class="contList-cont">
          <p class="cont-top">
            <span>{{infor_list.created_at}}</span>
            <span>订单编号 :
              <a>{{infor_list.order_sn}}</a>
            </span>
            <span>和我联系<i></i>
            </span>
          </p>
          <table class="cont-table">
            {% for goods_infor in infor_list.order_goods %}
              {% if loop.index == 1 %}
                <tr>
                  <td class="goods-info">
                    <a href="/trade/order/detail?order_sn={{list_info.order_sn}}">
                      <img src="{{goods_infor.goods_thumb}}" alt="">
                      <div class="goods-detail">
                        <h5 class="goods-name">{{goods_infor.goods_name}}
                          <strong class="goods-num">×{{goods_infor.goods_number}}</strong>
                        </h5>
                        <p>
                          <span>属性:<a>{{goods_infor.str_attr}}</a></span></p>
                      </div>
                    </a>
                  </td>
                  {% if infor_list.order_goods.length < 2 %}
                    {% if infor_list.invoice_issue == 0 %}
                      <td class="ID-nunm"></td>
                      <td class="ID-noth">未开</td>
                      <td class="ID-open">开具发票</td>
                    {% elseif infor_list.invoice_issue == 1 %}
                      <td class="ID-nunm">电子发票</td>
                      <td class="ID-have">已开</td>
                      <td class="ID-open">
                        <em class="inv-detail">
                          <a href="/invoice/invoice-detail">查看详情</a>
                        </em>
                        <b>下载</b>
                      </td>
                    {% endif %}
                  {% else %}
                    {% if infor_list.invoice_issue == 0 %}
                      <td class="ID-nunm" rowspan="{{infor_list.order_goods.length}}"></td>
                      <td class="ID-noth" rowspan="{{infor_list.order_goods.length}}">未开</td>
                      <td class="ID-open" rowspan="{{infor_list.order_goods.length}}">开具发票</td>
                    {% elseif infor_list.invoice_issue == 1 %}
                      <td class="ID-nunm" rowspan="{{infor_list.order_goods.length}}">电子发票</td>
                      <td class="ID-have" rowspan="{{infor_list.order_goods.length}}">已开</td>
                      <td class="ID-open" rowspan="{{infor_list.order_goods.length}}">
                        <em class="inv-detail">
                          <a href="/invoice/invoice-detail">查看详情</a>
                        </em>
                        <b>下载</b>
                      </td>
                    {% endif %}
                  {% endif %}
                </tr>
              {% else %}
                <tr>
                  <td class="goods-info">
                    <a href="/trade/order/detail?order_sn={{list_info.order_sn}}">
                      <img src="{{goods_infor.goods_thumb}}" alt="">
                      <div class="goods-detail">
                        <h5 class="goods-name">{{goods_infor.goods_name}}
                          <strong class="goods-num">×{{goods_infor.goods_number}}</strong>
                        </h5>
                        <p>
                          <span>属性:<a>{{goods_infor.str_attr}}</a></span></p>
                      </div>
                    </a>
                  </td>
                </tr>
              {% endif %}
            {% endfor %}
          </table>
        </div>
      {% endfor %}
      <div class="page_box">
        <div class="total-num">{{data.data.data.total}}</div>
        <div class="page-num" style="display: none;">{{para.page}}</div>
        <div id="page" class="page_div"></div>
      </div>
    </div>
  </div>
  <section class="clear-float"></section>

  <script type="text/javascript" src="/assets/js/goods/paging.js"></script>
  <script type="text/javascript" src="/assets/js/invoice.js"></script>
{% endblock %}
