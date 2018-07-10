$(function($) {
  // 表单验证
  Validform.formCheck({valiContent: '#passwd-reset', submitBtn: '#passwd-reset-btn', passwordStrength: '#passwordStrength', isAjax: false});

  // 修改密码
  $('#passwd-reset').submit(function(event) {
    $.ajax({url: 'passwd-reset', type: 'POST', data: $(this).serializeArray()}).done(function(data) {
      $("button[name='reset']").click();
      $.tips(data.msg);
    }).fail(function(err) {
      console.log(err);
    });
    return false;
  });

  // 取消修改密码
  $('#passwd-cancel-btn').on('click', function(event) {
    window.location.href = '/security/index';
  });
});
