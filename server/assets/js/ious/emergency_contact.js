// 是否选中同意条款
var isSelected = false
// 是否显示清除按钮
function showClear(input, clear) {
  if ($(input).val() !== '') {
    $(clear).show()
  } else {
    $(clear).hide()
  }
}

$(function(){

  $('#linkman').focus( function () {
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

  // 点击清除
  $('#clearFir').mousedown( function () {
    $('#linkman').val('')
    $(this).hide()
  })
  $('#clearSec').mousedown( function () {
    $('#cellphone').val('')
    $(this).hide()
  })

  // 点击同意条款
  var isAgree = false
  $('#agree').click( function () {
    isSelected = !isSelected
    isAgree = false
    $(this).removeClass('act-checkbox-selected')
    if (isSelected) {
      isAgree = true
      $(this).addClass('act-checkbox-selected')
    }
  })

  // 下拉选择
  $('#relation').focus(function() {
    console.log('slideDown')
    $('#selectRelation').slideDown()
  }).blur(function() {
    console.log('slideUp')
    $('#selectRelation').slideUp()
  })
  $('#selectRelation li').stop(true, true).click(function  (e) {
    e.stopPropagation();
    $("#relation").val($(this).text());
    $(this).parents('#selectRelation').slideUp();
  })

  // 提交表单
  $('#formSubmit').click(function() {
    if ($('#linkman').val() !== '' && $('#cellphone').val() !== '' && $('#relation').val() !== '' && isAgree) {
      $.ajax({
        url: 'emergency-contact',
        type: 'post',
        data: {
          link_man: $('#linkman').val(),
          link_mobile: $('#cellphone').val(),
          link_relation: $('#relation').val()
        },
        error: function(data, status, e) {
          console.log(data.readyState)
          console.log(e)
        },
        success: function(res) {
          console.log('添加紧急联系人回调', res);
          if (res.code == 1) {
            window.location.href="/"
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
