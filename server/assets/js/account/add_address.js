$(function($) {
  // 表单验证
  Validform.formCheck({valiContent: '.delivery-address', submitBtn: '.confirm', isAjax: false});

  // 地址重定向
  function redirect() {
    window.location.href = 'delivery-address';
  }

  // 默认城市级联
  var data = {
    province: $('#province_name').val(),
    city: $('#city_name').val(),
    district: $('#district_name').val()
  };
  $('#distpicker').distpicker(data);

  // 添加编辑收货地址
  $('.delivery-address').submit(function(event) {
    $.ajax({url: 'add-address', type: 'POST', data: $(this).serializeArray()}).done(function(data) {
      $('#msg').remove();
      if (data.code == 1) {
        // $('.title').before('<div id="msg" class="success-msg">' + data.msg + '</div>');
        redirect();
      } else {
        $('.title').before('<div id="msg" class="error-msg">' + data.msg + '</div>');
      }
    });
    return false;
  });

  // 取消
  $('.cancel').click(function(event) {
    redirect();
  });
});
