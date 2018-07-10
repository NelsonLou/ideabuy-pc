$(function($) {

  // 切换登录方式
  $('.login-type li').each(function() {
    $(this).click(function() {
      $('.login-type li').css('color', '#333');
      $(this).css('color', '#FD7E24');
      if ($(this).html() === '扫码登录') {
        $('.qrcode-login').show(800);
        $('.login-form').hide(800);
      }
      if ($(this).html() === '账户登录') {
        $('.qrcode-login').hide(800);
        $('.login-form').show(800);
      }
    });
  });

  // 二维码登录
  $.ajax({url: 'qrcode', type: 'POST', async: true}).done(function(data) {
    $('.qrcode').attr('src', 'http://qr.topscan.com/api.php?text=' + data.data.qruuid);
    var timer = setInterval(function() {
      $.ajax({
        url: 'qrcodeBind',
        type: 'POST',
        data: {
          qruuid: data.data.qruuid
        }
      }).done(function(data) {
        data.code === 1
          ? window.location.href = '/'
          : '';
        if (data.code === 10192) {
          $.tips('二维码已过期');
          clearInterval(timer);
        }
      }).fail(function(err) {
        console.log(err);
      });
    }, 1000);
  }).fail(function(err) {
    console.log(err);
  });

  // 表单验证
  Validform.formCheck({valiContent: '#login-form', submitBtn: '.login-btn', isAjax: false});

  // 用户登录
  $('#login-form').submit(function(event) {
    $.ajax({url: '/auth/login', type: 'POST', data: $(this).serializeArray()}).done(function(data) {
      data.code === 1
        ? window.location.href = data.url
        : $.tips('账号或密码错误');
    }).fail(function(err) {
      console.log(err);
    });
    return false;
  });

});
