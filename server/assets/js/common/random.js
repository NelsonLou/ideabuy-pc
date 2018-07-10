function random(selector) {
  // 获取图片验证码
  $.ajax({url: '/random'}).done(function(data) {
    $(selector).attr('src', data.path);
  }).fail(function(err) {
    console.log(err);
  });
}
