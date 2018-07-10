$(function($) {
  // 银行选择
  var drop = true;

  $('.bank').click(function() {
    if (drop) {
      $('.drop-t').show();
      $('.drop-d').hide();
      $('.drop-down').slideDown();
      drop = false;
    } else {
      $('.drop-t').hide();
      $('.drop-d').show();
      $('.drop-down').slideUp();
      drop = true;
    }
  })

  $('.drop-down li').click(function() {
    $('.bank').find('img').css({'width': '35px', 'marginRight': '6px'}).attr('src', $(this).find('img').attr('src'));
    $('.bank').find('span').css('color', '#333').html($(this).find('span').html());
    $('.drop-t').hide();
    $('.drop-d').show();
    $('.drop-down').slideUp();
    drop = true;
  });

  // 表单验证
  Validform.formCheck({valiContent: '.form', submitBtn: '.confirm', isAjax: false});

  // 获取短信验证码
  $('.get-yzm').click(function(event) {
    $.ajax({
      url: '/sms',
      type: 'POST',
      data: {
        mobile: $('#card_mobile').val(),
        type: 4
      }
    }).done(function(data) {
      if (data.code === 1) {
        $.tips(data.msg)
      } else if (data.code === 90002) {
        $.tips('请输入银行预留手机号');
        $('#card_mobile').focus();
      }
    }).fail(function(err) {
      console.log(err);
    });
  })

  // 绑定银行卡
  $('#bind-bank').submit(function(event) {
    $.ajax({url: 'bind-bank', type: 'POST', data: $(this).serializeArray()}).done(function(data) {
      data.code === 10133
        ? $.tips('短信验证码错误')
        : window.location.href = '/account/bank-manage';
    }).fail(function(err) {
      console.log(err);
    });
    return false;
  });
});
