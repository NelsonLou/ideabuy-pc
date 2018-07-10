$(function(){
  //分页
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
		$("#page").paging({
			pageNo: page_mum,
			totalPage: all_page,
			totalSize: all_total,
			callback: function(num) {
				console.log(num)
        window.location.href = "/invoice/invoice-manage?limit" + limit + "&page=" + num
			}
		})
})
