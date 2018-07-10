// 是否显示清除按钮
function showClear(input, clear) {
  if ($(input).val() !== '') {
    $(clear).show()
  } else {
    $(clear).hide()
  }
}

// 是否显示placeholder
// function showPlaceholder(input, placeholder) {
//   if ($(input).val() !== '') {
//     $(placeholder).hide()
//   } else {
//     $(placeholder).show()
//   }
// }

$(function(){
  // $('#placeholderFir').mouseup( function () {
  //   $('#username')[0].focus()
  // });

  $('#username').focus( function () {
    // showPlaceholder(this, '#placeholderFir')
    showClear(this, '#clearFir')
  }).keyup( function () {
    // showPlaceholder(this, '#placeholderFir')
    showClear(this, '#clearFir')
  }).blur( function () {
    // showPlaceholder(this, '#placeholderFir')
    $('#clearFir').hide()
  })

  // $('#placeholderSec').mouseup( function () {
  //   $('#idcard')[0].focus()
  // });

  $('#idcard').focus( function() {
    // showPlaceholder(this, '#placeholderSec')
    showClear(this, '#clearSec')
  }).keyup(function() {
    // showPlaceholder(this, '#placeholderSec')
    showClear(this, '#clearSec')
  }).blur(function() {
    // showPlaceholder(this, '#placeholderSec')
    $('#clearSec').hide()
  })

  // 点击清除
  $('#clearFir').mousedown( function () {
    $(this).hide()
    $('#username').val('')
  })
  $('#clearSec').mousedown( function () {
    $('#idcard').val('')
    $(this).hide()
  })

  // 弹窗处理
  $('.act-btn-submit').click(function() {
    if ($('#username').val() !== '' && $('#idcard').val() !== '') {
      $('.act-overlay-window-name').text($('#username').val())
      $('.act-overlay-window-idcard').text($('#idcard').val().substr(0,6) + ' ' + $('#idcard').val().substr(6,8) + ' ' + $('#idcard').val().substr(14,4))
      $('.act-layer').show()
      $('.act-overlay').show()
    }
  });

  // 返回修改
  $('#modify').click(function() {
    $('.act-layer').hide()
    $('.act-overlay').hide()
  });

  // 提交表单
  $('#confirm').click(function() {
    $('.act-layer').hide()
    $('.act-overlay').hide()
    $.ajax({
      url: 'identification',
      type: 'post',
      data: {
        real_name: $('#username').val(),
        user_idcard: $('#idcard').val()
      },
      success: function(res) {
        console.log('身份验证回调', res);
        if (res.code == 1) {
          window.location.href="/ious/upload-idcard"
        } else {
          $('.act-overlay-window-msg').text(res.msg)
          $('.act-res-layer').show()
          $('.act-res-overlay').show()
        }
      }
    })
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
