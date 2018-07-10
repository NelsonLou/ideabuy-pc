$(function($) {
  // 表单验证
  Validform.formCheck({valiContent: '#payment-pwd-reset', submitBtn: '#payment-reset-btn', passwordStrength: '#passwordStrength', isAjax: false});

  // 二取短信验证码倒计时
  sms_countdown('#get-code');

  // 获取短信验证码
  $('#get-code').on('click', function(event) {
    sms(null, '#get-code', 3);
  });

  // 修改交易密码
  $('#payment-pwd-reset').submit(function(event) {
    $.ajax({url: 'payment-pwd-reset', type: 'POST', data: $(this).serializeArray()}).done(function(data) {
      $("button[name='reset']").click();
      $.tips(data.msg);
    }).fail(function(err) {
      console.log(err);
    });
    return false;
  });

  // 取消修改密码
  $('#payment-cancel-btn').on('click', function(event) {
    window.location.href = '/security/index';
  });
});
