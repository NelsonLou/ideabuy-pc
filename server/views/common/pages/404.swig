{% extends '../layouts/layout.swig' %}
{% block head %}
  <title>404</title>
  <link rel="stylesheet" href="/assets/css/not-found.css">
{% endblock %}
{% block content %}
  <div class="not-found">
    <img class="not-found-img" src="/assets/images/not-found.jpg">
    <p class="not-found-text">非常抱歉，您访问的页面在玩失踪～</p>
  </div>
{% endblock %}
