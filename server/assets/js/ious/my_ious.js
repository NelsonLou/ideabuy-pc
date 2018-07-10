$(document).ready(function() {
  $(".ious-bill-hiddenInfo").click(function() {
    $(".ious-dialogBox").removeClass("common-display");
  });
  $(".ious-month-info").click(function() {
    $(".ious-dialogBox").removeClass("common-display");
  });
  $(".dialog-title-btn").click(function() {
    $(".ious-dialogBox").addClass("common-display");
  });
  $(".ious-bill-btns span").click(function(event) {
    $(this).addClass('ious-bill-btnsAct').siblings().removeClass('ious-bill-btnsAct');
  });
  // 底部表格切换
  $('.ious-bill-already').click(function(event) {
    $('.ious-bill-table').addClass('common-display');
    $(".ious-bill-hidden").addClass('common-display');
    $('.ious-bill-doneBottom').css('background-image', 'url("/assets/images/icon/drop-up-white.png")');
    $('.ious-bill-done').removeClass('common-display');
    $('.ious-bill-doneBottom').removeClass('common-display');
    $('.ious-bill-have').addClass('common-display');
    $('.ious-bill-normol').removeClass('common-display');
  });
  $('.ious-bill-notyet').click(function(event) {
    $(".ious-bill-hidden").addClass('common-display');
    $('.ious-bill-doneBottom').css('background-image', 'url("/assets/images/icon/drop-up-white.png")');
    $('.ious-bill-table').addClass('common-display');
    $('.ious-bill-done').removeClass('common-display');
    $('.ious-bill-doneBottom').removeClass('common-display');
    $('.ious-bill-have').removeClass('common-display');
    $('.ious-bill-normol').addClass('common-display');
  });
  $('.ious-bill-payback').click(function(event) {
    $('.ious-bill-table').removeClass('common-display');
    $('.ious-bill-done').addClass('common-display');
    $('.ious-bill-doneBottom').addClass('common-display');

  });
  $('.ious-bill-refund').click(function(event) {
    $('.ious-bill-table').removeClass('common-display');
    $('.ious-bill-done').addClass('common-display');
    $('.ious-bill-doneBottom').addClass('common-display');
  });
  $('.ious-bill-info').click(function(event) {
    $('.ious-bill-table').removeClass('common-display');
    $('.ious-bill-done').addClass('common-display');
    $('.ious-bill-doneBottom').addClass('common-display');
  });
  // 账单详细下拉
  var hidden = 0;
  $('.ious-bill-doneBottom').click(function(){
    if( hidden == 1 ){
      $(".ious-bill-hidden").addClass('common-display');
      $('.ious-bill-doneBottom').css('background-image', 'url("/assets/images/icon/drop-up-white.png")');
      hidden = 0;
    }
    else{
      $(".ious-bill-hidden").removeClass('common-display');
      $('.ious-bill-doneBottom').css('background-image', 'url("/assets/images/icon/drop-down-white.png")');
      hidden = 1;
    }
  });
});
