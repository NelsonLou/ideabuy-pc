{% extends '../common/layouts/layout.swig' %}
{% block head %}
  <title>{{title}}</title>
  <link rel="stylesheet" href="/assets/css/staging.css">
{% endblock %}
{% block header %}
  {% include '../common/partials/header_user.swig' %}
{% endblock %}
{% block footer %}
  {% include '../common/partials/footer_user.swig' %}
{% endblock %}
{% block sidebar %}{% endblock %}
{% block content %}
  <div class="pay-success">
    <div class="success-box"></div>
  </div>
{% endblock %}
