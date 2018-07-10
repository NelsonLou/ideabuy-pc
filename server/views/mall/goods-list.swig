{% extends '../common/layouts/layout.swig' %}
{% block head %}
  <title>{{ title }}</title>
  <link rel="stylesheet" href="/assets/css/goods_list.css">
{% endblock %}
{% block content %}
  <div class="part-line">{{para.keyword}}</div>
  <div class="GL-container-top">
    <div class=""></div>
    <div class="goods-brand">
      {# <div class="GB-left-icon"></div> #}
      <div class="brand-border">{{para.brand_id}}</div>
      <span class="brand-label">品牌</span>
      <ul class="brand-all">
        {% for img_info in data.data.brand_list %}
          <li class=""><img src="{{img_info.brand_thumb}}" alt="{{img_info.brand_id}}"></li>
        {% endfor %}
      </ul>
      {# <a class="brand-more">更多+</a>
      <a class="brand-chooss">多选+</a> #}
      {# <p class="BC-btn">
        <span class="BC-btns BC-srue">确定</span>
        <span class="BC-btns BC-cancel">取消</span>
      </p> #}
      {# <div class="GB-right-icon"></div> #}
    </div>
    {# <div class="goods-price">
      <span class="GL-top-label">价格范围</span>
      <ul>
        <li>1-499元</li>
        <li>500-999元</li>
        <li>1000-1999元</li>
        <li>2000-2999元</li>
        <li>3000-4999元</li>
        <li>5000元以上</li>
      </ul>
    </div> #}
    {# <div class="goods-activ">
      <span class="GL-top-label">优惠活动</span>
      <ul>
        <li><span class="GA-mark"></span>存话费送手机</li>
        <li><span class="GA-mark"></span>买手机送话费</li>
        <li><span class="GA-mark"></span>老用户优惠购机（支持合约到期提前续约）</li>
        <li><span class="GA-mark"></span>裸机热卖</li>
        <li><span class="GA-mark"></span>沃白条分期购机</li>
      </ul>
      <p class="GA-btn">
        <span class="GA-btns GA-srue">确定</span>
        <span class="GA-btns GA-cancel">取消</span>
      </p>
      <a class="activ-chooss">多选+</a>
    </div> #}
    {# <div class="goods-chara">
      <span class="GL-top-label">特点</span>
      <ul>
        <li><span class="GB-mark"></span>双卡双待</li>
        <li><span class="GB-mark"></span>千元智能</li>
        <li><span class="GB-mark"></span>大屏（4.0英寸以上）</li>
      </ul>
      <p class="GC-btn">
        <span class="GC-btns GC-srue">确定</span>
        <span class="GC-btns GC-cancel">取消</span>
      </p>
      <a class="chara-chooss">多选+</a>
    </div> #}
    <div class="goods-compr">
      <div class="choos_para" style="display: none;">{{para.sort}}</div>
      <span class="GL-top-label">综合</span>
      <ul>
        {% if para.sort == "sales_volume" %}
          <li class="sales-volume choos-style">销量<em class="comper-down"></em>
          </li>
        {% else %}
          <li class="sales-volume">销量<em class=""></em>
          </li>
        {% endif %}
        {% if para.sort == "goods_comment" %}
          <li class="comper-comment choos-style">评论<em class="comper-down"></em>
          </li>
        {% else %}
          <li class="comper-comment">评论<em class=""></em>
          </li>
        {% endif %}
        {% if para.sort == "goods_price" %}
          <li class="comer-price choos-style">价格<em class="comper-down"></em>
          </li>
        {% elseif para.sort == "goods_price,asc" %}
          <li class="comer-price choos-style">价格<em class="comper-up"></em>
          </li>
        {% else %}
          <li class="comer-price">价格<em class=""></em>
          </li>
        {% endif %}
        {% if para.sort == "created_at" %}
          <li class="goods-new choos-style">新品<em class="comper-down"></em>
          </li>
        {% else %}
          <li class="goods-new">新品<em class=""></em>
          </li>
        {% endif %}
      </ul>
      {# <div class="compr-inp">
        <p class="inp-sta"><span class="compr-company">￥</span><input type="text" name="" value=""></p>
        <span class="compr-bar">-</span>
        <p class="inp-end"><span class="compr-company">￥</span><input type="text" name="" value=""></p>
        <button class="inp-btn" type="button" name="button">确定</button>
      </div> #}
    </div>
  </div>
  <div class="UD-bar"></div>
  <div class="GL-container-list">
    <div class="GL-container">
      {% for goods_info in data.data.goods_list.data %}
        <div class="GL-detail">
          <div class="phone-img">
            <a href="/mall/goods-detail?goods_id={{goods_info.goods_id}}"><img src="{{goods_info.goods_img}}" alt=""></a>
            <span class="goods-poi">赠品</span>
          </div>
          <div class="PI-list">
            <ul>
              <li class="PI-list-red"><img src="{{goods_info.goods_img}}" alt=""></li>
            </ul>
          </div>
          <div class="goods-info">
            <p class="GI-name">
              <a href="/mall/goods-detail?goods_id={{goods_info.goods_id}}">{{goods_info.goods_name}}</a>
            </p>
            <p class="GI-pric">￥{{goods_info.goods_price}}</p>
            <p class="GI-mes">
              <span class="mes-ok">已成交<a class="mes-color">
                  {{goods_info.sales_number}}笔</a>
              </span>
              <span class="mes-anser">
                <em class="anser-icon"></em>
                <a class="mes-color">{{goods_info.comment_number}}</a>
              </span>
            </p>
          </div>
          {# <div class="buy-btn">立即购买</div> #}
        </div>
      {% endfor %}
      <div class="clear-float"></div>
    </div>
    <div class="page_box">
      <div class="total-num">{{data.data.goods_list.total}}</div>
      <div class="page-num" style="display: none;">{{para.page}}</div>
      <div id="page" class="page_div"></div>
    </div>
    <div class="goods-recom">
      <p class="recom-title">推荐商品</p>
      <div class="recom-list">
        <div class="recom-detail">
          <img src="/assets/images/goods/phone_11.jpg" alt="">
          <p class="recom-pric">￥3599</p>
          <p class="recom-name">[iPhone6s Plus] 32G 玫瑰金 联通4G版</p>
        </div>
        <div class="recom-detail">
          <img src="/assets/images/goods/phone_07.jpg" alt="">
          <p class="recom-pric">￥3599</p>
          <p class="recom-name">[iPhone6s Plus] 32G 玫瑰金 联通4G版</p>
        </div>
        <div class="recom-detail">
          <img src="/assets/images/goods/phone_11.jpg" alt="">
          <p class="recom-pric">￥3599</p>
          <p class="recom-name">[iPhone6s Plus] 32G 玫瑰金 联通4G版</p>
        </div>
        <div class="recom-detail">
          <img src="/assets/images/goods/phone_07.jpg" alt="">
          <p class="recom-pric">￥3599</p>
          <p class="recom-name">[iPhone6s Plus] 32G 玫瑰金 联通4G版</p>
        </div>
        <div class="recom-detail">
          <img src="/assets/images/goods/phone_11.jpg" alt="">
          <p class="recom-pric">￥3599</p>
          <p class="recom-name">[iPhone6s Plus] 32G 玫瑰金 联通4G版</p>
        </div>
      </div>
    </div>
    <div class="goods-conduct">
      <img src="/assets/images/goods/phone_15.jpg" alt="">
    </div>
  </div>

  <script type="text/javascript" src="/assets/js/goods/paging.js"></script>
  <script type="text/javascript" src="/assets/js/goods/goods_list.js"></script>
{% endblock %}
