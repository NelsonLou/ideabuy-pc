// 是否显示清除按钮
function showClear(input, clear) {
  if ($(input).val() !== '') {
    $(clear).show()
  } else {
    $(clear).hide()
  }
}

$(function(){

  $('#passwordFir').focus( function () {
    showClear(this, '#clearFir')
  }).keyup( function () {
    showClear(this, '#clearFir')
  }).blur( function () {
    $('#clearFir').hide()
  })

  $('#passwordSec').focus(function() {
    showClear(this, '#clearSec')
  }).keyup(function() {
    showClear(this, '#clearSec')
  }).blur(function() {
    $('#clearSec').hide()
  })

  // 点击清除
  $('#clearFir').mousedown( function () {
    $('#passwordFir').val('')
    $(this).hide()
  })
  $('#clearSec').mousedown( function () {
    $('#passwordSec').val('')
    $(this).hide()
  })

  // 验证密码是否六位
  $('#passwordFir').blur( function () {
    if ($('#passwordFir').val().length !== 6) {
      $('#verifyFir').show()
    } else {
      $('#verifyFir').hide()
    }
  })

  // 验证两次密码是否一致
  $('#passwordSec').blur( function () {
    if ($('#passwordFir').val() !== $('#passwordSec').val()) {
      $('#verifySec').show()
    } else {
      $('#verifySec').hide()
    }
  })

  // 提交表单
  $('#formSubmit').click(function() {
    if ($('#passwordFir').val() !== '' && $('#passwordFir').val().length === 6 && $('#passwordFir').val() === $('#passwordSec').val()) {
      $.ajax({
        url: 'set-deal-password',
        type: 'post',
        data: {
          pay_password: $('#passwordFir').val(),
          pay_password_confirm: $('#passwordSec').val()
        },
        error: function(data, status, e) {
          console.log(data.readyState)
          console.log(e)
        },
        success: function(res) {
          console.log('设置交易密码回调', res);
          if (res.code == 1) {
            window.location.href="/ious/bind-bank-card"
          } else {
            $('.act-overlay-window-msg').text(res.msg)
            $('.act-res-layer').show()
            $('.act-res-overlay').show()
          }
        }
      })
    }
  });
  $('#resClose').click(function(event) {
    $('.act-res-layer').hide()
    $('.act-res-overlay').hide()
  });
  $('#resAllright').click(function(event) {
    $('.act-res-layer').hide()
    $('.act-res-overlay').hide()
  });

});
