<!DOCTYPE html>
<html lang="zh">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://apps.bdimg.com/libs/pure/0.5.0/base-min.css">
    <link rel="stylesheet" href="/assets/css/common.css">
    <link rel="shortcut icon" type="image/x-icon" href="/assets/favicon.png">
    {% block head %}{% endblock %}
    <script src="https://apps.bdimg.com/libs/jquery/1.8.3/jquery.min.js"></script>
    <script src="/assets/js/common.js"></script>
  </head>
  <body>
    {% block header %}
      {% include '../partials/header.swig' %}
    {% endblock header %}

    <div class="container-user">
      <div class="common-crumbs common-w">
        <a href="/account/profile">个人中心</a>
        <span>&gt;</span>
        <span class="container-user-title">{{title}}</span>
      </div>
      <div class="common-clearfloat common-w">
        {% block sidebar %}
          {% include '../partials/sidebar_user.swig' %}
        {% endblock %}
        <div class="common-right layoutU-right">
          {% block content %}{% endblock %}
        </div>
      </div>
    </div>
    <!-- /.container -->

    {% block footer %}
      {% include '../partials/footer_user.swig' %}
    {% endblock footer %}
  </body>
</html>
