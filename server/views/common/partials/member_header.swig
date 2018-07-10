<div class="header">
  <div class="header-content">
    <div class="logo">
      <a href="/">
        <img src="/assets/images/member/logo.png" alt="">
      </a>
    </div>
    <div class="title">
      {{ title }}
    </div>
    {% if title === "欢迎注册" %}
      <div class="sgin">
        <span>已有账号？
        </span>
        <a href="login" class="login">
          请登录</a>
      </div>
    {% endif %}
  </div>
</div>
