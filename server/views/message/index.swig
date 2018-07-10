{% extends '../common/layouts/layout_user.swig' %}
{% block head %}
  <title>{{ title }}</title>
  <link rel="stylesheet" href="/assets/css/my_news.css">
{% endblock %}
{% block content %}
  <div>
    <div class="content">
      <div class="minBox">
        <div class="right">
          <div class="right-hear">
            <div class="newsTitle-box">
              <div class="newsTitleBox-notice myNewsBtn">
                <span>公告</span></div>
              <div class="newsTitleBox-personal myNewsBtn">
                <span>通知</span></div>
            </div>
          </div>
          <div class="right-content">
            <div class="notice-viewBox myNewsView">
              <div class="notice-view">
                {% for val in data.data.list %}
                  <div class="noticeView-list">
                    <span class="nvList-title">{{ val.title }}</span>
                    <span class="nvList-date">{{ val.send_time }}</span>
                    {# <span class="nvList-minute">08:09:10</span> #}
                    <p class="nvList-content">{{ val.content }}</p>
                  </div>
                {% endfor %}
              </div>
            </div>
            <div class="personal-viewBox myNewsView">
              <div class="personal-view">
                <div class="personalView-list">
                  <span class="pvList-title">白条通知</span>
                  <span class="pvList-date">2014-02-03</span>
                  <span class="pvList-minute">08:09:10</span>
                  <input type="checkbox" name="choose" class="pvList-checkbox">
                  <span class="pvList-content">您的白条已经激活成功，快来打白条吧。</span>
                </div>
                <div class="personalView-list">
                  <span class="pvList-title">白条通知</span>
                  <span class="pvList-date">2014-02-03</span>
                  <span class="pvList-minute">08:09:10</span>
                  <input type="checkbox" name="choose" class="pvList-checkbox">
                  <span class="pvList-content">您的白条已经激活成功，快来打白条吧。</span>
                </div>
                <div class="personalView-list">
                  <span class="pvList-title">白条通知</span>
                  <span class="pvList-date">2014-02-03</span>
                  <span class="pvList-minute">08:09:10</span>
                  <input type="checkbox" name="choose" class="pvList-checkbox">
                  <span class="pvList-content">您的白条已经激活成功，快来打白条吧。</span>
                </div>

              </div>
              <div class="personal-foor">
                <input type="checkbox" onclick="doCheck()" name="allChecked" class="personalFoor-checkbox">
                <span class="personalFoor-text">全选</span>
                <button class="personalFoor-btn">删除</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script src="/assets/js/message/my_news.js"></script>
{% endblock %}
