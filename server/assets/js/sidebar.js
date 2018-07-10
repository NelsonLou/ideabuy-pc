// 购物侧边栏
$(document).ready(function() {
  // 购物车商品数量
  var goods_num = $(".cart-goods").length;
  if (goods_num > 0) {
    $(".goods-num").text(goods_num);
    $('.sidebar-shopcar-num').text(goods_num);
  }
  // 侧边导航栏——购物车
  var tip_shopcar = 0;
  var tip_coupons = 0;
  $(".sidebar-shopcar-box").on("click", function(e) {
    tip_shopcar = 1;
    $('.sidebar').css('right', '300px');
    $('.sidebar-side-hTitle').text('购物车');
    $(".sidebar-side-hidden").removeClass('common-display');
    $(".sidebar-side-shopcar").removeClass('common-display');
    $(".sidebar-side-coupons").addClass('common-display');
    $(".sidebar-coupons").css('background-color', '#000')
    $(".sidebar-shopcar-box").css('background-color', '#FF0036');
    $('.sidebar-shopcar').css('border-top', '1px solid #FF0036')
    $('.sidebar-shopcar').css('border-bottom', '1px solid #FF0036')
    $(document).one("click", function() {
      tip_shopcar = 0;
      $('.sidebar').css('right', '0px');
      $(".sidebar-side-hidden").addClass('common-display');
      $(".sidebar-side-shopcar").addClass('common-display');
      $(".sidebar-shopcar-box").css('background-color', '#000')
      $('.sidebar-shopcar').css('border-top', '1px solid #fff')
      $('.sidebar-shopcar').css('border-bottom', '1px solid #fff')
      $('.sidebar-shopcar-num').css('background-color', '#FF0036');
      $('.sidebar-shopcar-num').css('color', '#fff');
    });
    e.stopPropagation();
  });
  $(".sidebar-side-hidden").on("click", function(e) {
    e.stopPropagation();
  });
  // 侧边导航栏——优惠券
  $(".sidebar-coupons").on("click", function(e) {
    tip_coupons = 1;
    $('.sidebar').css('right', '300px');
    $(".sidebar-coupons").css('background-color', '#FF0036');
    $(".sidebar-shopcar-box").css('background-color', '#000')
    $('.sidebar-shopcar').css('border-top', '1px solid #fff')
    $('.sidebar-shopcar').css('border-bottom', '1px solid #fff')
    $('.sidebar-side-hTitle').text('优惠券');
    $(".sidebar-side-shopcar").addClass('common-display');
    $(".sidebar-side-hidden").removeClass('common-display');
    $(".sidebar-side-coupons").removeClass('common-display');
    $(document).one("click", function() {
      tip_coupons = 0;
      $('.sidebar').css('right', '0px');
      $(".sidebar-coupons").css('background-color', '#000')
      $(".sidebar-side-hidden").addClass('common-display');
      $(".sidebar-side-coupons").addClass('common-display');
    });
    e.stopPropagation();
  });
  $(".sidebar-side-hidden").on("click", function(e) {
    e.stopPropagation();
  });
  // 鼠标划入划出购物车
  $(".sidebar-shopcar-box").mouseover(function(event) {
    if (tip_shopcar == 0) {
      $(".sidebar-shopcar-box").css('background-color', '#FF0036');
      $('.sidebar-shopcar').css('border-top', '1px solid #FF0036')
      $('.sidebar-shopcar').css('border-bottom', '1px solid #FF0036')
      $('.sidebar-shopcar-num').css('background-color', '#fff');
      $('.sidebar-shopcar-num').css('color', '#FF0036');
    }
  }).mouseout(function(event) {
    if (tip_shopcar == 0) {
      $(".sidebar-shopcar-box").css('background-color', '#000')
      $('.sidebar-shopcar').css('border-top', '1px solid #fff')
      $('.sidebar-shopcar').css('border-bottom', '1px solid #fff')
      $('.sidebar-shopcar-num').css('background-color', '#FF0036');
      $('.sidebar-shopcar-num').css('color', '#fff');
    }
  });
  // 鼠标划入划出优惠券
  $(".sidebar-coupons").mouseover(function(event) {
    if (tip_coupons == 0) {
      $(".sidebar-coupons").css('background-color', '#FF0036');
    }
  }).mouseout(function(event) {
    if (tip_coupons == 0) {
      $(".sidebar-coupons").css('background-color', '#000');
    }
  });
  $('.sidebar-side-hidden').on('click', '.icon-close-circle', function(event) {
    event.preventDefault();
    tip_shopcar = 0;
    $('.sidebar').css('right', '0px');
    $(".sidebar-side-hidden").addClass('common-display');
    $(".sidebar-side-shopcar").addClass('common-display');
    $(".sidebar-shopcar-box").css('background-color', '#000')
    $('.sidebar-shopcar').css('border-top', '1px solid #fff')
    $('.sidebar-shopcar').css('border-bottom', '1px solid #fff')
    $('.sidebar-shopcar-num').css('background-color', '#FF0036');
    $('.sidebar-shopcar-num').css('color', '#fff');
  });
});
