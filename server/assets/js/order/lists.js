$(function(){
  //åˆ†é¡µ
    var page_mum = $('.page-num').text()
    var all_total = $('.total-num').text()
    var limit = 10
    if (all_total / limit < 1) {
      var all_page = 1
    }else{
      var all_page = Math.ceil(all_total / limit)
      // console.log(all_page);
    }
    var choos_para = $('.choos_para').text()
    var orderStatus = $('.order_sta').text()
		$("#page").paging({
			pageNo:page_mum,
			totalPage: all_page,
			totalSize: all_total,
			callback: function(num) {
				console.log(num)
        if (orderStatus == "") {
          window.location.href = "/trade/order/lists?limit" + limit + "&page=" + num
        }else if (orderStatus == "dfk") {
          window.location.href = "/trade/order/lists?limit" + limit + "&page=" + num + "&status=dfk"
        }else if (orderStatus == "dfh") {
          window.location.href = "/trade/order/lists?limit" + limit + "&page=" + num + "&status=dfh"
        }else if (orderStatus == "dsh") {
          window.location.href = "/trade/order/lists?limit" + limit + "&page=" + num + "&status=dsh"
        }else{
          window.location.href = "/trade/order/lists?limit" + limit + "&page=" + num + "&status=dpj"
        }
			}
		})
    $(".confirm-receipt").each(function(){
      var order_num = ""
      $(this).click(function(){
        order_num = $(this).find('b').text()
        $.ajax({
          url: '/trade/order/lists-sure',
          type: 'POST',
          data: {order_sn: order_num}
        })
        .done(function(res) {
          if (res.code == 1) {
            location.reload()
          }
        })
      })
    })
    $('.order-del').each(function(){
      var orderId = ""
      $(this).click(function() {
      console.log('立即del', order_pay)
        orderId = $(this).find('i').text()
        $.ajax({
          url: '/trade/order/lists-del',
          type: 'POST',
          data: {order_id: orderId}
        })
        .success(function(res) {
          if (res.code == 1) {
            location.reload()
          }
        })
      });
    })
    $('.immedia-pay').each(function(){
      var order_pay = ""
      $(this).click(function(){
        order_pay = $(this).find('b').text()
        $.ajax({
          url: '/trade/order/lists-pay',
          type: 'POST',
          data: {order_sn: order_pay}
        })
        .success(function(res) {
          if (res.code == 1) {
            location.href=res.data.url
          }
        })
      })
    })
})
