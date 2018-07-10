{% extends '../common/layouts/layout_user.swig' %}
{% block head %}
  <title>{{ title }}</title>
  <link rel="stylesheet" href="/assets/css/coupon.css">
{% endblock %}
{% block content %}
  <div class="content">
    <div class="minBox">
      <div class="right">
        <div class="right-hear">
          <div class="newsTitle-box">
            <div class="newsTitleBox-notice myNewsBtn">
              <span>可使用</span></div>
            <div class="newsTitleBox-personal myNewsBtn">
              <span>已使用</span></div>
            <div class="newsTitleBox-personal myNewsBtn newBtnLeft">
              <span>已失效</span></div>
          </div>
        </div>
        <div class="right-content">
          <div class="notice-viewBox myNewsView">
            <div class="notice-view">
              <div class="noticeView-list">
                <div class="nVL-imagesDiv">
                  <p class="nVL-imagesDiv-title">每满99减5劵</p>
                  <p class="nVL-imagesDiv-pO">开学季活动页商品可用，限时购</p>
                  <p class="nVL-imagesDiv-pT">畅想购白条优惠券</p>
                </div>
                <p class="listContent-pO">开学季活动页商品专享劵</p>
                <p class="listContent-pT">劵编号：20112140231</p>
                <p class="listContent-pF">使用说明：本优惠券仅可用于购买开学季活动页中的商品可用</p>
                <p class="listContent-pS">平台限制：全平台</p>
                <p class="listContent-pE">有效期：2015-09-09至2016-09-09</p>
                <div class="listContent-btn">
                  <p>立即使用&#12288>></p>
                </div>
              </div>
              <div class="noticeView-list">
                <div class="nVL-imagesDiv">
                  <p class="nVL-imagesDiv-title">每满99减5劵</p>
                  <p class="nVL-imagesDiv-pO">开学季活动页商品可用，限时购</p>
                  <p class="nVL-imagesDiv-pT">畅想购白条优惠券</p>
                </div>
                <p class="listContent-pO">开学季活动页商品专享劵</p>
                <p class="listContent-pT">劵编号：20112140231</p>
                <p class="listContent-pF">使用说明：本优惠券仅可用于购买开学季活动页中的商品可用</p>
                <p class="listContent-pS">平台限制：全平台</p>
                <p class="listContent-pE">有效期：2015-09-09至2016-09-09</p>
                <div class="listContent-btn">
                  <p>立即使用&#12288>></p>
                </div>
              </div>
              <div class="noticeView-list">
                <div class="nVL-imagesDiv">
                  <p class="nVL-imagesDiv-title">每满99减5劵</p>
                  <p class="nVL-imagesDiv-pO">开学季活动页商品可用，限时购</p>
                  <p class="nVL-imagesDiv-pT">畅想购白条优惠券</p>
                </div>
                <p class="listContent-pO">开学季活动页商品专享劵</p>
                <p class="listContent-pT">劵编号：20112140231</p>
                <p class="listContent-pF">使用说明：本优惠券仅可用于购买开学季活动页中的商品可用</p>
                <p class="listContent-pS">平台限制：全平台</p>
                <p class="listContent-pE">有效期：2015-09-09至2016-09-09</p>
                <div class="listContent-btn">
                  <p>立即使用&#12288>></p>
                </div>
              </div>
            </div>
            {#<ul class="theme_body">
                        <div id="pagecount" class="pagecount">

                        </div>
                     </ul>#}
          </div>
          <div class="personal-viewBox myNewsView">
            <div class="personal-view">
              <div class="personalView-list">
                <div class="pVL-imagesDiv">
                  <p class="pVL-imagesDiv-title">每满99减5劵</p>
                  <p class="pVL-imagesDiv-pO">开学季活动页商品可用，限时购</p>
                  <p class="pVL-imagesDiv-pT">畅想购白条优惠券</p>
                </div>
                <p class="tlistContent-pO">开学季活动页商品专享劵</p>
                <p class="tlistContent-pT">劵编号：20112140231</p>
                <p class="tlistContent-pF">使用说明：本优惠券仅可用于购买开学季活动页中的商品可用</p>
                <p class="tlistContent-pS">平台限制：全平台</p>
                <p class="tlistContent-pE">有效期：2015-09-09至2016-09-09</p>
                <div class="tlistContent-btn">
                  <p>已使用</p>
                </div>
              </div>
            </div>
          </div>
          <div class="Invalid-viewBox myNewsView">
            <div class="Invalid-view">
              <div class="InvalidView-list">
                <div class="iVL-imagesDiv">
                  <p class="iVL-imagesDiv-title">每满99减5劵</p>
                  <p class="iVL-imagesDiv-pO">开学季活动页商品可用，限时购</p>
                  <p class="iVL-imagesDiv-pT">畅想购白条优惠券</p>
                </div>
                <p class="ilistContent-pO">开学季活动页商品专享劵</p>
                <p class="ilistContent-pT">劵编号：20112140231</p>
                <p class="ilistContent-pF">使用说明：本优惠券仅可用于购买开学季活动页中的商品可用</p>
                <p class="ilistContent-pS">平台限制：全平台</p>
                <p class="ilistContent-pE">有效期：2015-09-09至2016-09-09</p>
                <div class="ilistContent-btn">
                  <p>已失效</p>
                </div>
              </div>
              <div class="InvalidView-list">
                <div class="iVL-imagesDiv">
                  <p class="iVL-imagesDiv-title">每满99减5劵</p>
                  <p class="iVL-imagesDiv-pO">开学季活动页商品可用，限时购</p>
                  <p class="iVL-imagesDiv-pT">畅想购白条优惠券</p>
                </div>
                <p class="ilistContent-pO">开学季活动页商品专享劵</p>
                <p class="ilistContent-pT">劵编号：20112140231</p>
                <p class="ilistContent-pF">使用说明：本优惠券仅可用于购买开学季活动页中的商品可用</p>
                <p class="ilistContent-pS">平台限制：全平台</p>
                <p class="ilistContent-pE">有效期：2015-09-09至2016-09-09</p>
                <div class="ilistContent-btn">
                  <p>已失效</p>
                </div>
              </div>
            </div>

          </div>

        </div>
      </div>
    </div>
  </div>
  <script src="/assets/js/account/coupon.js"></script>
{% endblock %}
