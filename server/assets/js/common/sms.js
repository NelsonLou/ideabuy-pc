// 发送短信验证码
function sms(selector, btn_selector, type) {
  if (selector == null) {
    para = {
      type: type
    };
  } else {
    para = {
      mobile: $(selector).val(),
      type: type
    };
  }

  // 发送短信验证码
  $.ajax({url: '/sms', type: 'POST', data: para}).done(function(data) {
    if (data.code === 1) {
      $(btn_selector).css('background', '#CCC').attr('disabled', true);
      var delay = 60;
      var timer = setInterval(function() {
        delay--;
        $(btn_selector).html(delay + '秒后重新发送');
        typeof(Storage) !== 'undefined'
          ? setLocalDelay(delay)
          : $.tips('抱歉！您的浏览器不支持 Web Storage ...');
        if (delay === 0) {
          $(btn_selector).css('background', '#F7F7F7').attr('disabled', false).html('获取验证码');
          clearInterval(timer);
        }
      }, 1000);
    }
    $.tips(data.msg)
  }).fail(function(err) {
    console.log(err);
  });
}

// 获取短信验证码倒计时
function sms_countdown(btn_selector) {
  var localDelay = getLocalDelay();
  var timeLine = parseInt((new Date().getTime() - localDelay.time) / 1000);

  if (timeLine > localDelay.delay) {
    $(btn_selector).html('获取验证码');
  } else {
    $(btn_selector).css('background', '#CCC').attr('disabled', true);
    var _delay = localDelay.delay - timeLine;
    var timer = setInterval(function() {
      if (_delay > 1) {
        _delay--;
        setLocalDelay(_delay);
        $(btn_selector).html(_delay + '秒后重新发送');
      } else {
        clearInterval(timer);
        $(btn_selector).css('background', '#F7F7F7').attr('disabled', false).html('获取验证码');
      }
    }, 1000);
  }
}

// 存储数据 localStorage
function setLocalDelay(delay) {
  // location.href 作为页面的唯一标识
  localStorage.setItem("delay_" + window.location.href, delay);
  localStorage.setItem("time_" + window.location.href, new Date().getTime());
}

// 读取数据 localStorage
function getLocalDelay() {
  return LocalDelay = {
    delay: localStorage.getItem("delay_" + window.location.href),
    time: localStorage.getItem("time_" + window.location.href)
  };
}
