{% extends '../common/layouts/layout_user.swig' %}
{% block head %}
  <title>{{ title }}</title>
  <link rel="stylesheet" href="/assets/css/delivery_address.css">
{% endblock %}
{% block content %}
  <div class="address-box">
    <div class="address-header">
      <span>{{ title }}</span>
      <a class="add-address" href="add-address">新增地址</a>
    </div>
    {# end 标题 #}
    {% if data.data.address_list.length > 0 %}
      <table id="delivery-address">
        <tr>
          <th>收件人</th>
          <th>地址</th>
          <th>联系电话</th>
          <th>操作</th>
          <th>状态</th>
        </tr>
        {% for key, val in data.data.address_list %}
          <tr>
            <td>{{ val.consignee }}</td>
            <td>{{ val.province_name }}
              {{ val.city_name }}
              {{ val.district_name }}</td>
            <td>{{ val.mobile }}</td>
            <td>
              <a href="add-address?id={{val.address_id}}">编辑 /</a>
              <span class="delete" data-id="{{val.address_id}}">删除</span>
            </td>
            <td>
              {% if val.default === 0 %}
                <span class="set-default" data-id="{{val.address_id}}">设置为默认</span>
              {% else %}
                <span class="set-default default" data-id="{{val.address_id}}">默认地址</span>
              {% endif %}
            </td>
          </tr>
        {% endfor %}
      </table>
    {% else %}
      <p style="padding: 10px;text-align: center;font-size: 16px;">暂无收货地址</p>
    {% endif %}
    {# end 地址管理列表 #}
  </div>
  <script src="/assets/js/utils/alert.min.js"></script>
  <script src="/assets/js/account/delivery_address.js"></script>
{% endblock %}
