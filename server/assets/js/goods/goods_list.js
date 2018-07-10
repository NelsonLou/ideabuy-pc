$(function(){
  // 品牌
  // var more = false
  // var count = null
  // $('.brand-more').click(function(){
  //   more = !more
  //   count = 1
  //   if (more) {
  //     $('.goods-brand ul').removeClass('brand-all').addClass('brand-all-drow')
  //   }else{
  //     $('.goods-brand ul').removeClass('brand-all-drow').addClass('brand-all')
  //   }
  // })
  // $('.brand-chooss').click(function(){
  //   count = 2
  //   more = false
  //   $('.BC-btn').slideDown(300)
  //   $('.goods-brand ul').removeClass('brand-all').addClass('brand-all-drow')
  // })
  // $('.BC-srue').click(function(){
  //   more = false
  //   $('.BC-btn').slideUp(300)
  //   $('.goods-brand ul').removeClass('brand-all-drow').addClass('brand-all')
  // })
  // $('.BC-cancel').click(function(){
  //   more = false
  //   $('.BC-btn').slideUp(300)
  //   $('.goods-brand ul').removeClass('brand-all-drow').addClass('brand-all')
  // })
  // if (count = 2) {
  //   var li_count = false
  //   $('.goods-brand ul li').each(function(){
  //     $(this).click(function(){
  //       li_count = !li_count
  //       if (li_count) {
  //         $(this).addClass('brand_box')
  //         li_count = false
  //       }else{
  //         $(this).removeClass('brand_box')
  //       }
  //       console.log(li_count);
  //     })
  //   })
  // }
  // 商品列表按钮
  $('.chara-chooss').click(function(){
    $('.chara-chooss').addClass('chooses_btn')
    $('.GC-btn').slideDown(300)
    $('.goods-chara .GB-mark').show();
  })
  $('.GC-btns').click(function() {
    $('.GC-btn').slideUp(300)
    $('.goods-chara .GB-mark').hide();
    $('.chara-chooss').removeClass('chooses_btn')
  });
  $('.activ-chooss').click(function(){
    $('.activ-chooss').addClass('chooses_btn')
    $('.GA-btn').slideDown(300)
    $('.goods-activ .GA-mark').show();
  })
  $('.GA-btns').click(function() {
    $('.GA-btn').slideUp(300)
    $('.goods-activ .GA-mark').hide();
    $('.activ-chooss').removeClass('chooses_btn')
  });
  // 单选
  $('.goods-activ ul li').each(function(i) {
    var dount = 0
    $(this).click(function() {
      dount++
      if(dount % 2 == 1){
        $(this).find('span').addClass('GAB-check-in')
      }else{
        $(this).find('span').removeClass('GAB-check-in')
      }
      $('.GA-btn .GA-cancel').click(function(){
        dount = 0
        $('.goods-activ ul li span').removeClass('GAB-check-in')
      })
    });
  });
  $('.goods-chara ul li').each(function(i) {
    var eount = 0
    $(this).click(function() {
      eount++
      if(eount % 2 == 1){
        $(this).find('span').addClass('GAB-check-in')
      }else{
        $(this).find('span').removeClass('GAB-check-in')
      }
      $('.GC-btn .GC-cancel').click(function(){
        eount = 0
        $('.goods-chara ul li span').removeClass('GAB-check-in')
      })
    });
  });
  // 商品列表筛选
    // $('.sales-volume').click(function(){
    //   if ($('.sales-volume em').attr('class') !== 'comper-down') {
    //     $(this).find('em').removeClass('comper-up').addClass('comper-down')
    //   }else {
    //     $(this).find('em').removeClass('comper-down').addClass('comper-up')
    //   }
    //   $(this).siblings().find('em').removeClass('comper-up')
    //   $(this).siblings().find('em').removeClass('comper-down')
    // })
    // $('.comper-comment').click(function(){
    //   if ($('.comper-comment em').attr('class') !== 'comper-down') {
    //     $(this).find('em').addClass('comper-down').removeClass('comper-up')
    //   } else {
    //     $(this).find('em').removeClass('comper-down').addClass('comper-up')
    //   }
    //   $(this).siblings().find('em').removeClass('comper-up')
    //   $(this).siblings().find('em').removeClass('comper-down')
    // })
    // $('.goods-compr ul li').each(function(){
    //   $(this).click(function({
    //     $(this).addClass('choos-style').siblings().removeClass('choos-style')
    //   }))
    // })
    $('.comer-price').click(function(){
      if ($('.comer-price em').attr('class') !== 'comper-down') {
        $(this).find('em').addClass('comper-down').removeClass('comper-up')
      } else {
        $(this).find('em').removeClass('comper-down').addClass('comper-up')
      }
      $(this).siblings().find('em').removeClass('comper-up')
      $(this).siblings().find('em').removeClass('comper-down')
    })
  // 手机详情图联动效果
  $('.PI-list ul li').each(function(i){
    $(this).click(function(){
      $(this).addClass('PI-list-red').siblings().removeClass('PI-list-red')
      $('.phone-img img').eq(i).show().siblings().hide()
    })
  })
  //筛选商品请求
  //分页
    var page_mum = $('.page-num').text()
    var all_total = $('.total-num').text()
    var limit = 15
    if (all_total / limit < 1) {
      var all_page = 1
    }else{
      var all_page = Math.ceil(all_total / limit)
      console.log(all_page);
    }
    var choos_para = $('.choos_para').text()
		$("#page").paging({
			pageNo:page_mum,
			totalPage: all_page,
			totalSize: all_total,
			callback: function(num) {
				console.log(num)
        window.location.href = "/mall/goods-list?brand_id=" + $('.brand-border').text() + "&sort=" + choos_para + "&page=" + num
			}
		})
  // 搜索
  var search_text = ""
  $('.common-right a').click(function(){
    var line_val = $('.part-line').attr('value')
    var input_value = $('.header-search-input').val()
    $('.part-line').text(input_value)
    search_text = $('.part-line').text()
    console.log(search_text);
    window.location.href = "/mall/goods-list/" + search_text + "/%20/%20"
  })
  search_text = $('.part-line').text()
  // 品牌
  $('.goods-brand ul li').each(function(i){
    // console.log($(this).find('img').attr('alt'), '32322131654461');
    if ($(this).find('img').attr('alt') == $('.brand-border').text()) {
      $(this).addClass('brand-box').siblings().removeClass('brand-box')
    }
    $(this).click(function(){
      var brand_number = $(this).find('img').attr('alt')
      window.location.href = "/mall/goods-list?brand_id=" + brand_number
    })
  })
  // 销量
  $('.sales-volume').click(function() {
    if ($('.brand-border').text() == "") {
      window.location.href = "/mall/goods-list?sort=sales_volume"
    }else{
      window.location.href = "/mall/goods-list?brand_id=" + $('.brand-border').text() + "&sort=sales_volume"
    }
  });
  // 评论
  $('.comper-comment').click(function() {
    if ($('.brand-border').text() == "") {
      window.location.href = "/mall/goods-list?sort=goods_comment"
    }else{
      window.location.href = "/mall/goods-list?brand_id=" + $('.brand-border').text() + "&sort=goods_comment"
    }
  });
  // 价格
  $('.comer-price').click(function() {
    if ($(this).find('em').attr('class') == 'comper-down') {
      var price_number = 'goods_price' // 将序
    }else {
      var price_number = 'goods_price,asc' // 升序
    }
    if ($('.brand-border').text() == "") {
      window.location.href = "/mall/goods-list?sort=" + price_number
    }else{
      window.location.href = "/mall/goods-list?brand_id=" + $('.brand-border').text() + "&sort=" + price_number
    }
  });
  // 新品
  $('.goods-new').click(function() {
    if ($('.brand-border').text() == "") {
      window.location.href = "/mall/goods-list?sort=created_at"
    }else{
      window.location.href = "/mall/goods-list?brand_id=" + $('.brand-border').text() + "&sort=created_at"
    }
  });
})
