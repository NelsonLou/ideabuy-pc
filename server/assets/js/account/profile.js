$(function($) {
  // 表单验证
  Validform.formCheck({valiContent: '.profile', submitBtn: '.save', isAjax: false});

  // 默认城市级联
  var data = {
    province: $('#province_name').val(),
    city: $('#city_name').val(),
    district: $('#district_name').val()
  };
  $('#distpicker').distpicker(data);

  // 保存个人信息
  $('.profile').submit(function(event) {
    $.ajax({url: 'profile', type: 'POST', data: $(this).serializeArray()}).done(function(data) {
      $.tips(data.msg);
    }).fail(function(err) {
      console.log(err);
    });
    return false;
  });
});
