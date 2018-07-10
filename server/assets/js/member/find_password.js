$(function($) {

  // 图片验证码
  random('.random');
  // 短信验证码
  sms_countdown('.first-step .get-sms-btn');

  // 生成图片验证码
  $('.switch').click(function() {
    random('.random');
  })

  // 获取短信验证码
  $('.first-step .get-sms-btn').click(function() {
    sms('.first-step .tel input', '.first-step .get-sms-btn', 2)
  });

  // 表单验证
  Validform.formCheck({valiContent: '.first-step', submitBtn: '.first-step .next', isAjax: true});
  Validform.formCheck({valiContent: '.second-step', submitBtn: '.second-step .next', isAjax: true});

  // 清空按钮
  $('.first-step .close').click(function() {
    $('.first-step .tel input').val('');
    $('.first-step .close').hide();
  });

  $('.second-step .close').click(function() {
    $('.second-step .newpwd-confirm input').val('');
    $('.second-step .close').hide();
  });

  $('.first-step .tel input').keyup(function() {
    if (!$('.first-step .tel input').val()) {
      $('.first-step .tel .close').hide();
    } else {
      $('.first-step .tel .close').show();
    }
  });

  $('.second-step .newpwd-confirm input').keyup(function() {
    if (!$('.second-step .newpwd-confirm input').val()) {
      $('.second-step .close').hide();
    } else {
      $('.second-step .close').show();
    }
  });

  var telNum;
  var tel_yzm;
  var newpwd;
  var newpwd_repeat;

  // 找密验证身份
  $('.first-step .next').on('click', function(event) {
    telNum = $('.first-step .tel input');
    tel_yzm = $('.first-step .tel-yzm input');
    if (!telNum.val()) {
      $.tips('请输入手机号码');
      telNum.focus();
      return false;
    } else if (!tel_yzm.val()) {
      $.tips('请输入手机校验码');
      tel_yzm.focus();
      return false;
    } else {
      $.ajax({
        url: 'check-allcode',
        type: 'POST',
        data: {
          user_mobile: telNum.val(),
          code: tel_yzm.val()
        }
      }).done(function(data) {
        if (data.code === 1) {
          $('.first-step').hide();
          $('.second-step').show();
        }
        if (data.code === 500) {
          $.tips('短信验证码错误');
          tel_yzm.focus();
        }
      }).fail(function(err) {
        console.log(err);
      });
    }
  });

  // 设置新密码
  $('.second-step .next').on('click', function(event) {
    newpwd = $('.second-step .newpwd input');
    newpwd_repeat = $('.second-step .newpwd-confirm input');
    yzm = $('.second-step .yzm input');
    if (!newpwd.val()) {
      $.tips('请输入新密码')
      newpwd.focus();
      return false;
    } else if (newpwd.val().length < 8) {
      $.tips('密码长度不能小于8位');
      newpwd.focus();
      return false;
    } else if (newpwd.val().length > 16) {
      $.tips('密码长度不能超过16位');
      newpwd.focus();
      return false;
    } else if (newpwd.val() != newpwd_repeat.val()) {
      $.tips('密码不一致');
      $('#pwd').focus();
    } else {
      $.ajax({
        url: 'find-password',
        type: 'POST',
        data: {
          user_mobile: telNum.val(),
          code: tel_yzm.val(),
          user_password: newpwd.val(),
          confirm_password: newpwd_repeat.val(),
          verify_code: yzm.val()
        }
      }).done(function(data) {
        if (data.code === 10086) {
          $.tips(data.msg);
          yzm.val('').focus();
        } else if (data.code === 1) {
          $.tips(data.msg);
          $('.second-step').hide();
          $('.third-step').show();
        }
      }).fail(function(err) {
        console.log(err);
      });
    }
  });

});
