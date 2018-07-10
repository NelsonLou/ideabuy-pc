{% extends '../common/layouts/layout_user.swig' %}
{% block head %}
  <title>{{ title }}</title>
  <link rel="stylesheet" href="/assets/css/set_login_password.css">
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
            <form id="passwd-reset" action="#" method="post">
              <div class="minBox-inputBox inputBoxTopO">
                <label class="inputBox-title" for="old_user_password">旧密码</label>
                <input class="inputBox-input" type="password" name="old_user_password" id="old_user_password" placeholder="请输入旧密码" datatype="*8-16" errormsg="密码格式不正确" nullmsg="旧密码不能为空">
                <span class="text-error"></span>
              </div>
              <div class="minBox-inputBox inputBoxTopT">
                <label class="inputBox-title" for="user_password">新密码</label>
                <input class="inputBox-input" type="password" name="user_password" id="user_password" placeholder="请设置新密码" passwordstrength="passwordStrength" datatype="*8-16" errormsg="密码格式不正确" nullmsg="新密码不能为空">
                <span class="text-error"></span>
                <p class="inputBox-prompt">* 8-16位数字、字母和特殊字符</p>
              </div>
              <div class="minBox-inputBox inputBoxTopF">
                <label class="inputBox-title" for="confirm_password">确认新密码</label>
                <input class="inputBox-input" type="password" name="confirm_password" id="confirm_password" placeholder="请确认新密码" datatype="*8-16" errormsg="确认密码与新密码不一致" nullmsg="确认密码不能为空" recheck="user_password">
                <span class="text-error"></span>
              </div>
              <div class="setLoginBtnBox">
                <button type="reset" name="reset" style="display: none;">重置</button>
                <button class="loginBtnO" type="button" name="cancel" id="passwd-cancel-btn">取消</button>
                <button class="loginBtnT" type="submit" name="submit" id="passwd-reset-btn">确认</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script type="text/javascript" src="/assets/js/utils/validform.js"></script>
  <script type="text/javascript" src="/assets/js/utils/alert.min.js"></script>
  <script type="text/javascript" src="/assets/js/security/passwd-reset.js"></script>
{% endblock %}
