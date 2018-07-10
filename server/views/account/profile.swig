{% extends '../common/layouts/layout_user.swig' %}
{% block head %}
  <title>{{ title }}</title>
  <link rel="stylesheet" href="/assets/css/information.css">
  <link rel="stylesheet" href="/assets/css/city-picker.css">
{% endblock %}
{% block content %}
  <div class="content">
    <div class="minBox">
      <div class="right">
        <div class="right-hear">
          <span class="infor-title">{{ title }}</span>
          <span class="infor-suc">【个人信息越完整，授信额度越高！请及时完善个人信息】</span>
        </div>
        {# end 标题 #}
        <div class="right-content">
          <form class="profile" id="distpicker" action="profile" method="post">
            <input type="hidden" id="province_name" value="{{data.data.user.user_address_zhong.province}}">
            <input type="hidden" id="city_name" value="{{data.data.user.user_address_zhong.city}}">
            <input type="hidden" id="district_name" value="{{data.data.user.user_address_zhong.district}}">
            <div id="real_name" class="rightCon-minBox minBoxTwoBo">
              <label class="rightCon-minBox-title">姓名</label>
              {{ data.data.user.real_name }}
            </div>
            <div id="user_idcard" class="rightCon-minBox minBoxfourBo">
              <label class="rightCon-minBox-title">身份证</label>
              {{ data.data.user.user_idcard }}
            </div>
            <div id="user_mobile" class="rightCon-minBox minBoxFiveBo">
              <label class="rightCon-minBox-title">手机</label>
              {{ data.data.user.user_mobile }}
            </div>
            <div class="rightCon-minBox minBoxSexBo">
              <label for="city" class="rightCon-minBox-title">所在地区</label>
              <select class="form-control" name="province" id="province"></select>
              <select class="form-control" name="city" id="city"></select>
              <select class="form-control" name="district" id="district"></select>
            </div>
            <div class="rightCon-minBox minBoxAllBo">
              <label for="address" class="rightCon-minBox-title">详细地址</label>
              <input type="text" name="address" id="address" value="{{ data.data.user.address }}" datatype="*" nullmsg="* 详细地址不能为空">
              <span class="text-error" style="left:71px;bottom:-20px"></span>
            </div>
            <div class="rightCon-minBox minBoxAllBo">
              <label for="user_education" class="rightCon-minBox-title">学历</label>
              <select name="user_education" id="user_education">
                {% set education = [
                  '小学',
                  '初中',
                  '高中/职高',
                  '专科',
                  '本科',
                  '硕士',
                  '博士'
                ] %}
                {% for val in education %}
                  <option value="{{ val }}" {% if val == data.data.user.user_education %} selected="selected" {% endif %}>{{ val }}</option>
                {% endfor %}
              </select>
            </div>
            <div class="rightCon-minBox minBoxAllBo">
              <label for="user_profession" class="rightCon-minBox-title">职业</label>
              <input type="text" name="user_profession" id="user_profession" value="{{ data.data.user.user_profession }}">
            </div>
            <div class="rightCon-minBox minBoxAllBo">
              <label for="user_company" class="rightCon-minBox-title">公司</label>
              <input type="text" name="user_company" id="user_company" value="{{ data.data.user.user_company }}">
            </div>
            <div class="rightCon-minBox minBoxAllBo">
              <label for="user_income" class="rightCon-minBox-title">月收入</label>
              <select name="user_income" id="user_income">
                {% set income = [
                  '3000~5000',
                  '5000~8000',
                  '8000~10000',
                  '10000~15000',
                  '150000~20000',
                  '30000以上'
                ] %}
                {% for val in income %}
                  <option value="{{ val }}" {% if val == data.data.user.user_income %} selected="selected" {% endif %}>{{ val }}</option>
                {% endfor %}
              </select>
            </div>
            <div class="rightCon-minBox minBoxAllBo">
              <label for="user_qq" class="rightCon-minBox-title">QQ号</label>
              <input type="text" name="user_qq" id="user_qq" value="{{ data.data.user.user_qq }}">
            </div>
            <div class="rightCon-minBox minBoxAllBo">
              <label for="user_email" class="rightCon-minBox-title">E-mall</label>
              <input type="text" name="user_email" id="user_email" value="{{ data.data.user.user_email }}" datatype="e" errormsg="* 格式错误" ignore="ignore">
              <span class="text-error" style="left:71px;bottom:-20px"></span>
            </div>
            <button type="submit" class="save information-btn">保存</button>
          </form>
        </div>
        {# end 个人信息表单 #}
      </div>
    </div>
  </div>
  <script src="/assets/utils/distpicker.data.js"></script>
  <script src="/assets/utils/distpicker.js"></script>
  <script src="/assets/js/utils/validform.js"></script>
  <script src="/assets/js/utils/alert.min.js"></script>
  <script src="/assets/js/account/profile.js"></script>
{% endblock %}
