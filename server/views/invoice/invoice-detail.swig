{% extends '../common/layouts/layout_user.swig' %}
{% block head %}
  <title>{{ title }}</title>
  <link rel="stylesheet" href="/assets/css/invoice_detail.css">
{% endblock %}
{% block content %}
  {# 右边内容 #}
  <div class="right-content">
    <p class="ID-title">发票详情</p>
    <div class="inv-current">
      <p class="IC-p">发票信息 订单号：58920675830</p>
      <table class="IC-table">
        <tr>
          <td>发票类型</td>
          <td>电子发票</td>
        </tr>
        <tr>
          <td>发票内容</td>
          <td>明细</td>
        </tr>
        <tr>
          <td>发票抬头</td>
          <td>个人</td>
        </tr>
        <tr>
          <td>开票时间</td>
          <td>2017年08月04日 14:58:29</td>
        </tr>
        <tr>
          <td class="IC-money">金额</td>
          <td class="IC-yuan">30.00元</td>
        </tr>
        <tr>
          <td class="IC-type">订单类型</td>
          <td class="IC-feel">直冲</td>
        </tr>
      </table>
      <table class="electronic-invoice ">
        <tr>
          <th class="IC-code">发票代码</th>
          <th class="IC-num">发票号码</th>
          <th class="IC-qr">二维码</th>
          <th class="IC-down">下载</th>
        </tr>
        <tr>
          <td class="IC-code">031001600411</td>
          <td class="IC-num">27387552</td>
          <td class="IC-qr">
            <span class="IC-qrcode"></span>
            <b>（扫码可加入支付宝发票管家或微信卡包）</b>
          </td>
          <td class="IC-down">
            <a href="#">下载PDF电子发票</a>
            <strong>（下载后请使用PDF阅读器打开）</strong>
          </td>
        </tr>
      </table>
      <p class="IC-careful">注：如您是多张发票合并开票，电子发票单（PDF）上金额等于发票总金额，不能拆分。</p>
    </div>
  </div>
  <section class="clear-float"></section>

{% endblock %}
