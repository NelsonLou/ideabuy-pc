$(function($) {

  // 图片验证码
  random('.random');
  // 短信验证码
  sms_countdown('.getyzm');

  // 生成图片验证码
  $('.random, .switch').on('click', function(event) {
    random('.random');
  });

  // 获取短信验证码
  $('.getyzm').on('click', function(event) {
    if (!$('#tel').val()) {
      $.tips('手机号码不能为空');
      $('#tel').focus();
    } else {
      sms('#tel', '.getyzm', 1);
    }
  });

  // 表单验证
  Validform.formCheck({valiContent: '.register-box', submitBtn: '.next', passwordStrength: '#passwordStrength', isAjax: true});

  // 用户注册
  $('.next').on('click', function(event) {
    var tel = $('#tel').val();
    var pwd = $('#pwd').val();
    var pwd_repeat = $('#pwd-confirm').val();
    var img_code = $('#yzm').val();
    var tel_code = $('#tel-yzm').val();
    var agree = $('#agree').is(':checked');

    if (!tel) {
      $.tips('手机号码不能为空');
      $('#tel').focus();
      return false;
    } else if (!pwd) {
      $.tips('密码不能为空');
      $('#pwd').focus();
      return false;
    } else if (!pwd_repeat) {
      $.tips('请再次输入密码');
      $('#pwd-confirm').focus();
      return false;
    } else if (!img_code) {
      $.tips('请输入验证码');
      $('#yzm').focus();
      return false;
    } else if (!tel_code) {
      $.tips('请输入手机验证码');
      $('#tel-yzm').focus();
      return false;
    } else if (!agree) {
      $.tips('请接受畅想购白条服务协议');
      $('#agree').focus();
      return false;
    } else {
      $.ajax({
        url: '/member/register',
        type: 'POST',
        data: {
          user_mobile: tel,
          user_password: pwd,
          confirm_password: pwd_repeat,
          code: tel_code,
          verify_code: img_code
        }
      }).done(function(data) {
        console.log(data);
        if (data.code === 1) {
          // $.tips('注册成功');
          // 用户登录
          $.ajax({
            url: '/auth/login',
            type: 'POST',
            data: {
              user_mobile: tel,
              user_password: pwd
            }
          }).done(function(data) {
            data.code === 1
              ? window.location.href = '/ious/identification'
              : $.tips('账号或密码错误');
          }).fail(function(err) {
            console.log(err);
          });
        } else if (data.code === 10086) {
          $.tips('验证码错误');
          $('#yzm').focus();
        } else if (data.code === 10133) {
          $.tips('短信验证码错误');
          $('#tel-yzm').focus();
        }
      }).fail(function(err) {
        console.log(err);
      });
    }
  });

});
