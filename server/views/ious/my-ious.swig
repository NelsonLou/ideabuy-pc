{% extends '../common/layouts/layout_user.swig' %}
{% block head %}
  <title>{{title}}</title>
  <link rel="stylesheet" href="/assets/css/my_ious.css">
{% endblock %}
{% block content %}
  <script src="/assets/js/ious/my_ious.js" charset="utf-8"></script>
  <div class="common-clearfloat">
    <div class="my-ious common-right">
      {# 顶部title #}
      <div class="ious-title">
        <span class="ious-title-txt">我的白条</span>
      </div>
      {# 中部还款 #}
      <div class="ious-body common-clearfloat">
        <div class="ious-payback common-left">
          <div class="ious-payback-title">
            <span>9月剩余待还</span>
            <span>最后还款期限：9月20日</span>
          </div>
          <div class="ious-payback-amount common-clearfloat">
            <h1 class="common-left">￥{{data.data.should_pay_amount}}</h1>
            <a class="common-left ious-month-info" href="#">明细</a>
            <button class="common-right" type="button" name="button" onclick="javascript:window.location.href='pay-back'">立即还款</button>
          </div>
          <div class="ious-payback-barout">
            <div class="ious-payback-barin"></div>
          </div>
          <div class="ious-payback-info common-clearfloat">
            <span class="common-left">本月已还金额：</span>
            <span class="common-left">￥{{data.data.should_pay_all_amount}}</span>
            <span class="common-right">￥{{data.data.should_pay_all_amount}}</span>
            <span class="common-right">本月账单总额：</span>
          </div>
          <div class="ious-payback-table common-clearfloat">
            <div class="ious-payback-tablein tablein-left common-left">
              <span>10月累计待还</span>
              <span class="common-clearfloat">
                <h2 class="common-left">￥0.00</h2>
                <a class="common-left ious-month-info">明细</a>
              </span>
              <span>最后还款期限：9月20日</span>
            </div>
            <div class="ious-payback-tablein tablein-right common-right">
              <span>白条额度</span>
              <span class="common-clearfloat">
                <h2 class="common-left">￥{{data.data.white_amount}}</h2>
              </span>
              <span>可用额度： ￥{{data.data.white_available}}</span>
            </div>
            <div class="ious-payback-tableAdd common-right">
              <a>我要提额</a>
            </div>
          </div>
        </div>
        <div class="ious-credit common-right">
          <div class="ious-credit-top">
            <div class="ious-credit-roll">
              <div class="ious-credit-img"></div>
              <div class="ious-credit-rollTxt">
                <i>{{data.data.credit_point}}</i>
                <span>信用优秀</span>
              </div>
              <div class="ious-credit-rollTop"></div>
              <div class="ious-credit-rollBottom"></div>
            </div>
            <span class="ious-credit-txt">-沃信用-</span>
          </div>
          <div class="ious-credit-privilege">
            <span class="ious-credit-person"></span>
            <span class="ious-credit-bank"></span>
            <span class="ious-credit-phone"></span>
          </div>
        </div>
      </div>
      {# 底部账单(还款流水) #}
      <div class="ious-bill">
        <div class="ious-bill-title">
          <h4>白条账单</h4>
        </div>
        <div class="ious-bill-btns common-clearfloat">
          <span class="ious-bill-already ious-bill-btnsAct">已出账单</span>
          <span class="ious-bill-notyet">未出账单</span>
          <span class="ious-bill-payback">还款流水</span>
          <span class="ious-bill-refund">退款记录</span>
          <span class="ious-bill-info">消费明细</span>
        </div>
        {# 还款流水 表格 #}
        <div class="ious-bill-table common-display">
          <table>
            <tr>
              <th>还款金额（元）</th>
              <th>还款时间</th>
              <th>还款方式</th>
              <th>还款单号</th>
              <th>还款状态</th>
              <th>
                <a href="#">操作</a>
              </th>
            </tr>
            <tr>
              <td>2688.00</td>
              <td>2017-06-15 12:10:56</td>
              <td>工商银行</td>
              <td>170623154382316666</td>
              <td>已还款</td>
              <td>详情</td>
            </tr>
            <tr>
              <td>2688.00</td>
              <td>2017-06-15 12:10:56</td>
              <td>工商银行</td>
              <td>170623154382316666</td>
              <td>已还款</td>
              <td>详情</td>
            </tr>
            <tr>
              <td>2688.00</td>
              <td>2017-06-15 12:10:56</td>
              <td>工商银行</td>
              <td>170623154382316666</td>
              <td>已还款</td>
              <td>详情</td>
            </tr>
            <tr>
              <td>2688.00</td>
              <td>2017-06-15 12:10:56</td>
              <td>工商银行</td>
              <td>170623154382316666</td>
              <td>已还款</td>
              <td>详情</td>
            </tr>
            <tr>
              <td>2688.00</td>
              <td>2017-06-15 12:10:56</td>
              <td>工商银行</td>
              <td>170623154382316666</td>
              <td>已还款</td>
              <td>详情</td>
            </tr>
            <tr>
              <td>2688.00</td>
              <td>2017-06-15 12:10:56</td>
              <td>工商银行</td>
              <td>170623154382316666</td>
              <td>已还款</td>
              <td>详情</td>
            </tr>
          </table>
        </div>
        {# 已出账单  #}
        <div class="ious-bill-done common-clearfloat">
          <div class="ious-bill-doneNav common-left">
            <div class="ious-bill-shape">
              <span class="shape-left"></span>
              <span class="shape-right"></span>
              <span class="shape-data">本月账单</span>
            </div>
            <div class="ious-bill-billYear">2017年</div>
          </div>
          <div class="ious-bill-doneBox common-right">
            <div class="ious-bill-doneMain">
              <div class="ious-bill-doneAmount">账单总额：<span>950.48</span>
              </div>
              <div class="ious-bill-doneBookDay">记账日期：<span>2017-08-01至2017-08-31</span>
              </div>
              <div class="ious-bill-doneOutDay">出账日期：<span>2017-09-01</span>
              </div>
              <div class="ious-bill-doneSur">
                <div class="ious-bill-doneSurAmount">剩余待还：<span class="red">650.48</span>
                </div>
                <div class="ious-bill-doneSurPay">已还金额：<span>300.00</span>
                </div>
                <div class="ious-bill-doneSurDay">最后还款日：2017-09-20 23:59:59</div>
              </div>
            </div>
            <div class="ious-bill-hidden common-display">
              <ul class="common-clearfloat ious-bill-have">
                <li class="common-clearfloat">
                  <span class="ious-bill-hiddenBox"></span>
                  <span class="ious-bill-hiddenIous">2017年09月分期</span>
                  <span class="">账单分期</span>
                  <span>3/6期</span>
                  <span class="ious-bill-hiddenInfo">详情</span>
                  <span class="ious-bill-hiddenAmo">245.00</span>
                </li>
                <li class="common-clearfloat">
                  <span class="ious-bill-hiddenBox"></span>
                  <span></span>
                  <span class="ious-bill-name">测试手机</span>
                  <span>2017-06-06</span>
                  <span class="ious-bill-hiddenInfo">详情</span>
                  <span class="ious-bill-hiddenAmo">245.00</span>
                </li>
                <li class="common-clearfloat">
                  <span class="ious-bill-hiddenBox"></span>
                  <span>逾期总金额（含违约金）</span>
                  <span class="ious-bill-hiddenInfo">详情</span>
                  <span class="ious-bill-hiddenAmo">245.00</span>
                </li>
                <li class="common-clearfloat ious-bill-hiddenAll">
                  <span class="ious-bill-hiddenBox"></span>
                  <span>全选</span>
                  <span class="ious-bill-hiddenDll">
                    <a href="pay-back">立即还款</a>
                  </span>
                  <span class="ious-bill-hiddenAmoAll">金额<i>￥1080.00</i>
                  </span>
                </li>
              </ul>
              <div class="ious-bill-normol common-display">
                <span class="ious-bill-normolImg"></span>
                <span class="ious-bill-normolTxt">本月暂时没有账单哦~</span>
              </div>
            </div>
          </div>
        </div>
        <div class="ious-bill-doneBottom"></div>
      </div>
      {# 分页 #}
      <div class="ious-page-box common-clearfloat common-right">
        <div class="ious-page-boxLeft common-clearfloat common-left">
          <button class="ious-page-sub"></button>
          <button>1</button>
          <button>2</button>
          <span class="ious-page-ellipsisA common-clearfloat">
            <i></i>
            <i></i>
            <i></i>
          </span>
          <button>6</button>
          <button>7</button>
          <button>8</button>
          <span class="ious-page-ellipsisB">
            <i></i>
            <i></i>
            <i></i>
          </span>
          <button>14</button>
          <button class="ious-page-add"></button>
        </div>
        <div class="common-right ious-page-act">
          <span>跳至</span>
          <input class="ious-page-input" type="text" name="" value="">
          <span>页</span>
          <span class="ious-page-turn">跳转</span>
        </div>
      </div>
    </div>
  </div>
  {# 弹窗 #}
  <div class="ious-dialogBox common-display">
    <div class="ious-dialog">
      {# 弹窗头部 #}
      <div class="ious-dialog-title common-clearfloat">
        <span class="dialog-title-txt">分期明细</span>
        <button class="dialog-title-btn common-right"></button>
      </div>
      {# 分期明细 #}
      <div class="dialog-main common-display">
        <div class="dialog-main-top common-clearfloat">
          <div class="common-left">
            <span class="dialog-top-amount">本期应付（3/6期）：<i>1942.32</i>
            </span>
            <span class="dialog-top-else">86.11（含服务费，违约金2.77）</span>
          </div>
          <div class="common-right">
            <span class="iousInfo-red">逾期</span>
          </div>
        </div>
        <div class="dialog-main-bottom">
          <div class="dialog-main-list common-clearfloat">
            <span class="iousInfo-iousDateNum">3/6期</span>
            <span class="iousInfo-iousName">[雷诺塔四核酷睿i5 7500/GTX10...]等8种商品 订单号 ...</span>
          </div>
          <div class="dialog-main-list">
            <i class="iousInfo-gray">最后还款日：</i>
            2017-07-20 23:59:59</div>
          <div class="dialog-main-list">
            <i class="iousInfo-gray">分期期数：</i>共分6期</div>
          <div class="dialog-main-list">
            <i class="iousInfo-gray">每期应付：</i>1942.32（1891.26+51.06分期手续费）</div>
        </div>
      </div>
      {# 还款详情 #}
      <div class="dialog-main common-display">
        <div class="dialog-main-top common-clearfloat">
          <div class="common-left">
            <span class="dialog-top-amount">本期应付（3/6期）：<i class="dialog-red">1942.32</i>
            </span>
            <span class="dialog-top-else">86.11（含服务费，违约金2.77）</span>
          </div>
          <div class="common-right">
            <span class="paybak-date">还款日期：2017-06-23 12:10:43</span>
          </div>
        </div>
        <div class="dialog-main-bottom">
          <div class="dialog-main-list common-clearfloat">
            <span class="iousInfo-iousDateNum">3/6期</span>
            <span class="iousInfo-iousName">2017年09月分期</span>
            <span class="common-right">￥1662.32</span>
          </div>
          <div class="dialog-main-list common-clearfloat">
            <span class="iousInfo-iousDateNum">3/6期</span>
            <span class="iousInfo-iousName">2017年09月分期</span>
            <span class="common-right">￥1662.32</span>
          </div>
          <div class="dialog-main-list common-clearfloat">
            <span>[雷诺塔四核酷睿i5 7500/GTX10...]等8种商品 订单号 ...</span>
            <span class="common-right">￥31.321</span>
          </div>
          <div class="dialog-main-list common-clearfloat">
            <span class="dialog-red">逾期总金额（含违约金）</span>
            <span class="common-right">￥2.33</span>
          </div>
        </div>
      </div>
      {# 逾期详情 #}
      <div class="dialog-main">
        <div class="dialog-main-top common-clearfloat">
          <div class="common-left">
            <span class="dialog-top-amount">逾期金额：<i class="dialog-red">1942.32</i>
            </span>
            <span class="dialog-top-else">86.11（含服务费，违约金2.77）</span>
          </div>
        </div>
        <div class="dialog-main-bottom">
          <div class="dialog-main-list">
            <span class="iousInfo-iousName">2017年7月分期</span>
            <span class="common-right">￥662.32</span>
          </div>
          <div class="dialog-main-list">
            <span class="iousInfo-iousName">2017年8月分期</span>
            <span class="common-right">￥662.32</span>
          </div>
          <div class="dialog-main-list">
            <span class="iousInfo-iousName">2017年9月分期</span>
            <span class="common-right">￥662.32</span>
          </div>
        </div>
      </div>
    </div>
  </div>

{% endblock %}
