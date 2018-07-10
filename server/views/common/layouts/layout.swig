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

    <div class="container">
      {% block sidebar %}
        {% include '../partials/sidebar.swig' %}
      {% endblock %}
      {% block content %}{% endblock %}
    </div>
    <!-- /.container -->

    {% block footer %}
      {% include '../partials/footer.swig' %}
    {% endblock footer %}
  </body>
</html>
