{% extends '../common/layouts/layout_user.swig' %}
{% block head %}
  <title>{{ title }}</title>
  <link rel="stylesheet" href="/assets/css/set_transaction_password.css">
{% endblock %}
{% block content %}
  <div class="content">
    <div class="minBox">
      <div class="right">
        <div class="right-hear">
          <span class="setLogin-title">{{ title }}</span>
        </div>
        <div class="right-content">
          <div class="rightCon-minBox">
            <form id="payment-pwd-reset" action="#" method="post">
              {# <p class="minBox-titleO">请为手机号<span>{{ user_info.user_mobile }}</span></p> #}
              <p class="minBox-title">请重置6位纯数字的交易密码</p>
              <div class="minBox-inputBox inputBoxTopO">
                <label class="inputBox-title" for="pay_password">交易密码</label>
                <input class="inputBox-input" type="password" name="pay_password" id="pay_password" placeholder="请设置交易密码" datatype="*" errormsg="请输入6位纯数字交易密码" nullmsg="交易密码不能为空" passwordstrength="passwordStrength">
                <span class="text-error"></span>
              </div>
              <div class="minBox-inputBox inputBoxTopT">
                <label class="inputBox-title" for="confirm_pay_pwd">确认密码</label>
                <input class="inputBox-input" type="password" name="confirm_pay_pwd" id="confirm_pay_pwd" placeholder="请确认交易密码" datatype="*" errormsg="密码不一致！" nullmsg="确认密码不能为空" recheck="pay_password">
                <span class="text-error"></span>
              </div>
              <div class="minBox-inputBox inputBoxTopF" style="position: relative;">
                <label class="inputBox-title" for="code">验证码</label>
                <input class="inputBox-inputT" type="text" name="code" id="code" placeholder="请输入短信验证码" datatype="*" nullmsg="请输入短信验证码">
                <span class="text-error" style="position: absolute;top: 50px;left: 140px;"></span>
                <button class="inputBox-codeBtn" type="button" name="get-code" id="get-code">获取验证码</button>
              </div>
              <div class="setLoginBtnBox">
                <button type="reset" name="reset" style="display: none;">重置</button>
                <button class="loginBtnO" type="button" name="cancel" id="payment-cancel-btn">取消</button>
                <button class="loginBtnT" type="submit" name="submit" id="payment-reset-btn">确认</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script type="text/javascript" src="/assets/js/utils/validform.js"></script>
  <script type="text/javascript" src="/assets/js/utils/alert.min.js"></script>
  <script type="text/javascript" src="/assets/js/common/sms.js"></script>
  <script type="text/javascript" src="/assets/js/security/payment-pwd-reset.js"></script>

{% endblock %}
