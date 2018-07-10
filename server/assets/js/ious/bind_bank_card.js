
// 是否显示清除按钮
function showClear(input, clear) {
  if ($(input).val() !== '') {
    $(clear).show()
  } else {
    $(clear).hide()
  }
}

$(function(){

  sms_countdown('#smsSend');
  $('#bankCard').focus( function () {
    showClear(this, '#clearFir')
  }).keyup( function () {
    showClear(this, '#clearFir')
  }).blur( function () {
    $('#clearFir').hide()
  })

  $('#cellphone').focus(function() {
    showClear(this, '#clearSec')
  }).keyup(function() {
    showClear(this, '#clearSec')
  }).blur(function() {
    $('#clearSec').hide()
  })

  $('#msgVerify').focus(function() {
    showClear(this, '#clearThi')
  }).keyup(function() {
    showClear(this, '#clearThi')
  }).blur(function() {
    $('#clearThi').hide()
  })

  // 点击清除
  $('#clearFir').mousedown( function () {
    $('#bankCard').val('')
    $(this).hide()
  })
  $('#clearSec').mousedown( function () {
    $('#cellphone').val('')
    $(this).hide()
  })
  $('#clearThi').mousedown( function () {
    $('#msgVerify').val('')
    $(this).hide()
  })

  // 支持银行弹窗
  var infoIcon = true
  $('.act-form-bank-info').click(function() {
    infoIcon = !infoIcon
    if (infoIcon) {
      $('.act-bank-info-icon').show()
      $('.act-bank-info-close').hide()
      $('.act-bank-support').hide()
    } else {
      $('.act-bank-info-close').show()
      $('.act-bank-info-icon').hide()
      $('.act-bank-support').show()
    }
  })

  // 绑卡失败弹窗
  $('.act-btn-help').click(function() {
    $('.act-overlay-window-cut').hide()
    $('.act-overlay-window-help').show()
  });
  $('.act-overlay-close').click(function(event) {
    $(this).parent().parent().hide()
    hideOverlay()
  });
  $('.act-btn-right').click(function(event) {
    $('.act-overlay-window-cut').hide()
    hideOverlay()
  });
  $('.allright').click(function(event) {
    $('.act-overlay-window-fail').hide()
    hideOverlay()
  });
  $('.allright-help').click(function(event) {
    $('.act-overlay-window-help').hide()
    hideOverlay()
  });

  function hideOverlay() {
    $('.act-layer').hide()
    $('.act-overlay').hide()
  }

  // 获取验证码
  $('#smsSend').click(function() {
    if ($('#cellphone').val() !== '' && $('#cellphone').val().length === 11) {
      sms('#cellphone', '#smsSend', 4);
    }
  });

  // 提交表单
  $('#formSubmit').click(function() {
    if ($('#bankCard').val() !== '' && $('#cellphone').val() !== '' && $('#msgVerify').val() !== '') {
      $.ajax({
        url: 'bind-bank-card',
        type: 'post',
        data: {
          card_number: $('#bankCard').val(),
          card_mobile: $('#cellphone').val(),
          code: $('#msgVerify').val()
        },
        error: function(data, status, e) {
          console.log(data.readyState)
          console.log(e)
        },
        success: function(res) {
          console.log('添加银行卡回调', res);
          if (res.code == 1) {
            window.location.href="/ious/emergency-contact"
          } else if(res.code == 10146) {
            $('.act-overlay-window-cut').show()
            $('.act-layer').show()
            $('.act-overlay').show()
          } else {
            $('.act-overlay-window-fail .act-overlay-window-msg').text(res.msg)
            $('.act-overlay-window-fail').show()
            $('.act-layer').show()
            $('.act-overlay').show()
          }
        }
      })
    }
  });

});
