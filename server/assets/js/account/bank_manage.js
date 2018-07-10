$(function($) {
  var card_id,
    card_item;
  // 银行卡列表悬浮显示删除按钮
  $('.bankcard ul li').hover(function() {
    $(this).css('background', $(this).find('.color-stop').val()).find('.close').show();
  }, function() {
    $(this).css('background', $(this).find('.color-start').val()).find('.close').hide();
  });
});

// 删除银行卡
$('.close').click(function() {
  card_id = $(this).prevAll('.card-id').val();
  card_item = $(this).parent('.bankcard');
  $('.modal').show('show');
});

// 确认删除
$('.confirm').click(function() {
  $.ajax({
    url: 'delete-bank',
    type: 'POST',
    data: {
      card_id: card_id
    }
  }).done(function(data) {
    if (data.code === 1) {
      card_item.remove();
    }
    $.tips(data.msg);
    $('.modal').fadeOut('show');
  }).fail(function(err) {
    console.log(err);
  });
});

// 取消删除
$('.cancel').click(function() {
  $('.modal').fadeOut('show');
});
