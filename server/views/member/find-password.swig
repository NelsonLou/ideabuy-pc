{% extends '../common/layouts/layout.swig' %}
{% block head %}
  <title>{{ title }}</title>
  <link rel="stylesheet" href="/assets/css/find_password.css">
  <link rel="stylesheet" href="/assets/css/validform.css">
{% endblock %}

{% block sidebar %}{% endblock siderbar%}

{% block header %}
  {% include '../common/partials/member_header.swig' %}
{% endblock header %}

{% block content %}

  <div class="first-step">

    <div class="progress">
      <div class="identity-p">
        <div class="identity"></div>
        <div class="circular">1</div>
        <div class="title">验证身份</div>
      </div>
      <div class="setPwd-p">
        <div class="setPwd"></div>
        <div class="circular">2</div>
        <div class="title">设置新密码</div>
      </div>
      <div class="finsh-p">
        <div class="finsh"></div>
        <div class="circular">OK</div>
        <div class="title">完成</div>
      </div>
    </div>

    <div class="form">
      <div class="tel">
        <i class="close"></i>
        <label for="tel">手机号码</label>
        <input type="text" name="tel" id="tel" placeholder="请输入您的手机号码" datatype="m" nullmsg="* 请输入手机号码" errormsg="* 您的手机号码有误">
        <span class="text-error" style="left:140px;bottom:0"></span>
        <div class="tip"></div>
      </div>
      <div class="tel-yzm">
        <label for="tel-yzm">手机校验码</label>
        <input type="text" name="tel-yzm" id="tel-yzm" placeholder="输入验证码">
        <button class="get-sms get-sms-btn">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
        <div class="tip"></div>
      </div>
      <button class="next">下一步</button>
    </div>
  </div>

  <div class="second-step">

    <div class="progress">
      <div class="identity-p">
        <div class="identity"></div>
        <div class="circular">1</div>
        <div class="title">验证身份</div>
      </div>
      <div class="setPwd-p">
        <div class="setPwd"></div>
        <div class="circular">2</div>
        <div class="title">设置新密码</div>
      </div>
      <div class="finsh-p">
        <div class="finsh"></div>
        <div class="circular">OK</div>
        <div class="title">完成</div>
      </div>
    </div>

    <div class="form">
      <div class="newpwd">
        <label for="newpwd">
          <span style="color:#F02E2E">*</span>新密码</label>
        <input type="password" name="newpwd" id="newpwd" placeholder="请输入8-16位数字作为密码" datatype="pwd" errormsg="* 密码为8-16位数字和子母的组合，特殊字符无效" nullmsg="* 密码不能为空"/>
        <span class="text-error" style="left:140px;bottom:20px"></span>
        <div class="tip"></div>
      </div>
      <div class="newpwd-confirm">
        <i class="close"></i>
        <label for="newpwd-confirm">
          <span style="color:#F02E2E">*</span>再次输入新密码</label>
        <input type="password" name="newpwd-confirm" id="newpwd-confirm" placeholder="请再次输入您的密码" datatype="n6-16" errormsg="* 密码不一致" nullmsg="* 密码不能为空" recheck="newpwd">
        <span class="text-error" style="left:140px;bottom:20px"></span>
        <div class="tip"></div>
      </div>
      <div class="yzm">
        <label for="yzm">验证码</label>
        <input type="text" name="yzm" id="yzm" placeholder="输入验证码">
        <div class="img">
          <img class="random" src="" alt="captcha">
          <span class="text">看不清？</span>
          <span class="switch">换一张</span>
        </div>
      </div>
      <button class="next">提交</button>
    </div>
  </div>

  <div class="third-step">

    <div class="progress">
      <div class="identity-p">
        <div class="identity"></div>
        <div class="circular">1</div>
        <div class="title">验证身份</div>
      </div>
      <div class="setPwd-p">
        <div class="setPwd"></div>
        <div class="circular">2</div>
        <div class="title">设置新密码</div>
      </div>
      <div class="finsh-p">
        <div class="finsh"></div>
        <div class="circular">OK</div>
        <div class="title">完成</div>
      </div>
    </div>

    <div class="result">
      <img src="/assets/images/member/success.png" alt="">
      <div class="tip">
        <div class="tip-top">恭喜您，修改密码成功！</div>
        <div class="tip-bottom">您已成功修改密码，快去<a href="login">重新登录</a>吧~</div>
      </div>
    </div>

  </div>
  <script src="/assets/js/utils/validform.js"></script>
  <script src="/assets/js/common/random.js"></script>
  <script src="/assets/js/member/find_password.js"></script>
  <script src="/assets/js/utils/alert.min.js"></script>
  <script src="/assets/js/common/sms.js"></script>
{% endblock %}

{% block footer %}
  {% include '../common/partials/member_footer.swig' %}
{% endblock footer %}
