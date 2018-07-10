{% extends '../common/layouts/layout_user.swig' %}
{% block head %}
  <title>{{ title }}</title>
  <link rel="stylesheet" href="/assets/css/bank_manage.css">
{% endblock %}
{% block content %}
  <div class="bankcard-box">
    <div class="bankcard-header">
      <span class="title">{{ title }}</span>
      {% if data.data.total === 0 %}
        <span>暂无绑定银行卡 &nbsp;（目前只支持添加储蓄卡）</span>
      {% else %}
        <span>已添加</span>
        <span class="num">{{ data.data.total }}</span>
        <span>张银行卡 &nbsp;（目前只支持添加储蓄卡）</span>
      {% endif %}
    </div>
    {# end 标题 #}
    <div class="modal">
      <div class="delete">
        确认删除该银行卡吗？
        <div class="confirm">确定</div>
        <div class="cancel">取消</div>
      </div>
    </div>
    {# end 删除确认模态框 #}
    <div class="bankcard">
      <ul>
        {% for item in data.data.card_list %}
          <li class="bankcard" style="background: {{ item.color_start }}">
            <input type="hidden" class="card-id" value="{{ item.card_id }}">
            <input type="hidden" class="color-stop" value="{{ item.color_stop }}">
            <input type="hidden" class="color-start" value="{{ item.color_start }}">
            <img class="close" src="/assets/images/account/close.png" alt="close">
            <div class="bankcard-img" style="background-image: url({{ item.bank_logo }});background-position:center; background-size:100% 100%;"></div>
            <div class="bankcard-type">
              <span>{{ item.bank_name }}&nbsp;</span>
              <span>信用卡</span>
            </div>
            <div class="bankcard-num">
              <span>****</span>
              <span>{{ item.card_number }}</span>
            </div>
          </li>
        {% endfor %}
        <li class="add-bankcard">
          <a href="bind-bank">
            <div>
              <img class="add" src="/assets/images/account/add_bankcard.png" alt="add">
              <div class="title">添加银行卡</div>
            </div>
          </a>
        </li>
      </ul>
    </div>
    {# end 银行管理列表 #}
  </div>
  <script src="/assets/js/utils/alert.min.js"></script>
  <script src="/assets/js/account/bank_manage.js"></script>
{% endblock %}
