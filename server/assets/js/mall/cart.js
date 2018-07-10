$(document).ready(function() {
  // 商品数量加减
  $(".cart-order-numAdd").click(function(event) {
    let num = parseInt($(this).siblings('.cart-order-numMainTxt').text());
    num++;
    $(this).siblings('.cart-order-numMainTxt').text(num);
    let gnum = $(this).siblings('.cart-order-numMainTxt').text();
    let gprice = $(this).parent().parent().siblings('.cart-order-price').children('.cart-order-priceNow').children().text();
    let gcount = gnum * gprice;
    $(this).parent().parent().siblings('.cart-order-amount').children().text('￥' + gcount)
    calculateCart();
  });
  $(".cart-order-numSub").click(function(event) {
    let num = parseInt($(this).siblings('.cart-order-numMainTxt').text());
    if (num > 1) {
      num--;
    }
    $(this).siblings('.cart-order-numMainTxt').text(num);
    let gnum = $(this).siblings('.cart-order-numMainTxt').text();
    let gprice = $(this).parent().parent().siblings('.cart-order-price').children('.cart-order-priceNow').children().text();
    let gcount = gnum * gprice;
    $(this).parent().parent().siblings('.cart-order-amount').children().text('￥' + gcount)
    calculateCart();
  });
  // 商品删除
  $('.cart-order-info').on('mouseover', '.cart-order-act', function(event) {
    event.preventDefault();
    $(this).addClass('delete-hover')
  });
  $('.cart-order-info').on('mouseout', '.cart-order-act', function(event) {
    event.preventDefault();
    $(this).removeClass('delete-hover');
  });
  $('.cart-order-info').on('click', '.cart-order-act', function(event) {
    event.preventDefault();
    $.ajax({
      url: '/cart/delete',
      type: 'post',
      data: {
        cart_id: $(this).attr('cartId')
      },
      success: function(res) {
        console.log('删除成功', res);
        if (res.code) {
          location.reload(true);
        }
      }
    });
  });
  // 删除选中商品
  $('.cart-table-bottom').on('mouseover', '.cart-bottom-delete', function(event) {
    event.preventDefault();
    $(this).addClass('delete-hover')
  });
  $('.cart-table-bottom').on('mouseout', '.cart-bottom-delete', function(event) {
    event.preventDefault();
    $(this).removeClass('delete-hover');
  });
  $('.cart-table-bottom').on('click', '.cart-bottom-delete', function(event) {
    event.preventDefault();
    let arr = []
    for (let i = 0; i < $('.cart-order-select .selected').length; i++) {
      arr.push($($('.cart-order-select .selected')[i]).attr('cartId'));
    }
    $.ajax({
      url: '/cart/delete',
      type: 'post',
      data: {
        cart_id: arr.join()
      },
      success: function(res) {
        console.log('删除成功', res);
        if (res.code) {
          location.reload(true);
        }
      }
    });
  });
  // 去结算
  $('.cart-bottom-btn').on('click', '#confirmBuy', function(event) {
    event.preventDefault();
    if ($('.selected-bg').length) {
      let arr = []
      for (let i = 0; i < $('.selected-bg').length; i++) {
        arr.push({
          product_id: $($('.selected-bg')[i]).attr('productId'),
          goods_number: $($('.selected-bg')[i]).children().children('.cart-order-num').children().children('.cart-order-numMainTxt').text()
        });
      }
      console.log('去结算', arr);
      const para = {
        json_data: JSON.stringify({ goods_info: arr })
      }
      $.ajax({
        url: '/buy/confirm-buy',
        type: 'post',
        data: para,
        success: function(res) {
          if (res) {
            window.location.href = "/buy/submit-order";
          }
        }
      });
    }
  });
  // 商品选择
  $('.cart-order-select').on('click', '.select-goods', function(event) {
    event.preventDefault();
    if ($(this).attr('class').search('selected') == -1) {
      $(this).addClass('selected').parent().parent().parent('.cart-order-info').addClass('selected-bg')
    } else {
      $(this).removeClass('selected').parent().parent().parent('.cart-order-info').removeClass('selected-bg')
    }
    let goodsList = $(this).parent().parent().parent().siblings('.cart-order-info').length + 1
    let selected = $(this).parent().parent().parent().parent().children('.selected-bg').length
    if (goodsList == selected) {
      $(this).parent().parent().parent().siblings('.cart-shop-title').children('.select-store').addClass('selected')
    } else {
      $(this).parent().parent().parent().siblings('.cart-shop-title').children('.select-store').removeClass('selected')
    }
    if ($('.cart-shop-title').length == $('.cart-shop-title .selected').length) {
      $(this).parent().parent().parent().parent().parent().siblings('.cart-table-title').children().children('.select-all').addClass('selected')
      $(this).parent().parent().parent().parent().parent().siblings('.cart-table-bottom').children().children('.select-all').addClass('selected')
    } else {
      $(this).parent().parent().parent().parent().parent().siblings('.cart-table-title').children().children('.select-all').removeClass('selected')
      $(this).parent().parent().parent().parent().parent().siblings('.cart-table-bottom').children().children('.select-all').removeClass('selected')
    }
    calculateCart();
  });
  // 店铺全选
  $('.cart-shop-title').on('click', '.select-store', function(event) {
    event.preventDefault();
    if ($(this).attr('class').search('selected') == -1) {
      $(this).addClass('selected').parent().siblings('.cart-order-info').addClass('selected-bg').children().children().children('.select-goods').addClass('selected')
    } else {
      $(this).removeClass('selected').parent().siblings('.cart-order-info').removeClass('selected-bg').children().children().children('.select-goods').removeClass('selected')
    }
    if ($('.cart-shop-title').length == $('.cart-shop-title .selected').length) {
      $(this).parent().parent().parent().siblings('.cart-table-title').children().children('.select-all').addClass('selected')
      $(this).parent().parent().parent().siblings('.cart-table-bottom').children().children('.select-all').addClass('selected')
    } else {
      $(this).parent().parent().parent().siblings('.cart-table-title').children().children('.select-all').removeClass('selected')
      $(this).parent().parent().parent().siblings('.cart-table-bottom').children().children('.select-all').removeClass('selected')
    }
    calculateCart();
  });
  // 购物车全选
  $('.cart-table-title').on('click', '.select-all', function(event) {
    event.preventDefault();
    if ($(this).attr('class').search('selected') == -1) {
      $(this).addClass('selected').parent().parent().siblings('.cart-table-body').children().children().children('.cart-shop-checkBox').addClass('selected').parent().siblings('.cart-order-info').addClass('selected-bg').children().children().children('.select-goods').addClass('selected')
      $(this).parent().parent().siblings('.cart-table-bottom').children().children('.select-all').addClass('selected')
    } else {
      $(this).removeClass('selected').parent().parent().siblings('.cart-table-body').children().children().children('.cart-shop-checkBox').removeClass('selected').parent().siblings('.cart-order-info').removeClass('selected-bg').children().children().children('.select-goods').removeClass('selected')
      $(this).parent().parent().siblings('.cart-table-bottom').children().children('.select-all').removeClass('selected')
    }
    calculateCart();
  });
  $('.cart-table-bottom').on('click', '.select-all', function(event) {
    event.preventDefault();
    if ($(this).attr('class').search('selected') == -1) {
      $(this).addClass('selected').parent().parent().siblings('.cart-table-body').children().children().children('.cart-shop-checkBox').addClass('selected').parent().siblings('.cart-order-info').addClass('selected-bg').children().children().children('.select-goods').addClass('selected')
      $(this).parent().parent().siblings('.cart-table-title').children().children('.select-all').addClass('selected')
    } else {
      $(this).removeClass('selected').parent().parent().siblings('.cart-table-body').children().children().children('.cart-shop-checkBox').removeClass('selected').parent().siblings('.cart-order-info').removeClass('selected-bg').children().children().children('.select-goods').removeClass('selected')
      $(this).parent().parent().siblings('.cart-table-title').children().children('.select-all').removeClass('selected')
    }
    calculateCart();
  });
});

// 计算总价
function calculateCart() {
  let arr = []
  for (let i = 0; i < $('.selected-bg').length; i++) {
    arr.push({
      num: $($('.selected-bg')[i]).children().children('.cart-order-num').children().children('.cart-order-numMainTxt').text(),
      price: $($('.selected-bg')[i]).children().children('.cart-order-select').children().attr('productPrice')
    });
  }
  console.log(arr);
  let amount = 0
  for (let j = 0; j < arr.length; j++) {
    amount += arr[j].num * arr[j].price
  }
  $('.goods-num').text(arr.length)
  $('.goods-amount').text(amount)
  if ($('.selected-bg').length) {
    $('#confirmBuy').removeClass('confirm-disabled')
  } else {
    $('#confirmBuy').addClass('confirm-disabled')
  }
}
