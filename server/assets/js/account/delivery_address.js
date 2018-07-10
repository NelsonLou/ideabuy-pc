$(function($) {
  // 删除收货地址
  $('.delete').click(function(event) {
    $tr = $(this).parents('tr');
    $.ajax({
      url: 'del-address',
      type: 'POST',
      data: {
        address_id: $(this).attr('data-id')
      }
    }).done(function(data) {
      if (data.code == 1) {
        $tr.remove();
      }
      $.tips(data.msg);
    }).fail(function(err) {
      console.log(err);
    });
  });

  // 默认收货地址
  $('.set-default').click(function(event) {
    $this = $(this);
    $.ajax({
      url: 'def-address',
      type: 'POST',
      data: {
        address_id: $(this).attr('data-id')
      }
    }).done(function(data) {
      if (data.code == 1) {
        $('.set-default').removeClass('default').text('设置为默认');
        $this.addClass('default').text('默认地址');
      }
      $.tips(data.msg);
    }).fail(function(err) {
      console.log(err);
    });
  });
});
