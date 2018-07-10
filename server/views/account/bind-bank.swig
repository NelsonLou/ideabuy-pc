{% extends '../common/layouts/layout_user.swig' %}
{% block head %}
  <title>{{ title }}</title>
  <link rel="stylesheet" href="/assets/css/validform.css">
  <link rel="stylesheet" href="/assets/css/bind_bank.css">
{% endblock %}
{% block content %}
  <div class="bind-bank-box">
    <div class="bind-bank-header">
      <span class="title">{{ title }}</span>
      <span>（目前只支持绑定储蓄卡）</span>
      <div class="fr">
        <span>沃白条智能加密，保障您的用卡安全，了解</span>
        <span class="tip">安全保障</span>
      </div>
    </div>
    {# end 标题 #}
    <form class="form" action="#" method="post" id="bind-bank">
      <div class="title">请为您的白条绑定银行卡</div>
      <div class="cardholder">
        <label for="cardholder">持卡人</label>
        <input type="text" name="cardholder" id="cardholder" placeholder="请输入您的姓名" value="{{ data.data.real_name }}" disabled="disabled">
        <div class="tip">*为保障账号资金安全，只能绑定认证用户本人的银行卡</div>
      </div>
      <div class="card-num">
        <label for="card_number">银行卡号</label>
        <input type="text" name="card_number" id="card_number" placeholder="请输入银行卡号">
        <div class="tip">*请输入银行卡号，仅支持储蓄卡</div>
      </div>
      <div class="bank-change">
        <label for="bank-change">银行选择</label>
        <input type="text" name="bank-change" id="bank-change" placeholder="请选择您的开户银行">
        <div class="bank">
          <img src="/assets/images/account/fill.jpg" style="margin-right: 12px;" alt="bank logo">
          <span class="text" style="color: #CCC;">请选择您的开户银行</span>
        </div>
        <div class="drop-t"></div>
        <div class="drop-d"></div>
        <ul class="drop-down" style="display:none;">
          {% for item in data.data.bank %}
            <li>
              <img src="{{ item.bank_logo }}" style="width:35px;margin-right: 6px;" alt="bank logo">
              <span class="text">{{ item.bank_name }}</span>
            </li>
          {% endfor %}
        </ul>
        <div class="tip"></div>
      </div>
      <div class="tel">
        <label for="card_mobile">预留号码</label>
        <input type="text" name="card_mobile" id="card_mobile" placeholder="请输入您的银行预留号码" datatype="m" nullmsg="* 请输入银行预留手机号" errormsg="* 格式错误">
        <span class="text-error"></span>
        <div class="tip">*请输入银行预留手机号</div>
      </div>
      <div class="yzm">
        <label for="code">验证码</label>
        <input type="text" name="code" id="code" placeholder="请输入验证码信息">
        <span class="get-yzm">获取验证码</span>
      </div>
      <a href="/account/bank-manage" class="cancel">取消</a>
      <button type="submit" name="button" class="confirm">确定</button>
    </form>
    {# end 绑定银行卡表单 #}
  </div>
  <script src="/assets/js/utils/validform.js"></script>
  <script src="/assets/js/utils/alert.min.js"></script>
  <script src="/assets/js/account/bind_bank.js"></script>
{% endblock %}
