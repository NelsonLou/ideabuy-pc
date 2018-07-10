$(function(){

  // 图片上下滚动
  var count = $("#imageMenu li").length - 5; /* 显示 6 个 li标签内容 */
  var interval = $("#imageMenu li:first").width();
  var curIndex = 0;
  $('.scrollbutton').click(function(){
    if( $(this).hasClass('disabled') ) return false;
    if ($(this).hasClass('smallImgUp')) --curIndex;
    else ++curIndex;
    $('.scrollbutton').removeClass('disabled');
    if (curIndex == 0) $('.smallImgUp').addClass('disabled');
    if (curIndex == count-1) $('.smallImgDown').addClass('disabled');
    $("#imageMenu ul").stop(false, true).animate({"marginLeft" : -curIndex*interval + "px"}, 600);
  });
  // 解决 ie6 select框 问题
  $.fn.decorateIframe = function(options) {
    if ($.browser.msie && $.browser.version < 7) {
      var opts = $.extend({}, $.fn.decorateIframe.defaults, options);
      $(this).each(function() {
        var $myThis = $(this);
        //创建一个IFRAME
        var divIframe = $("<iframe />");
        divIframe.attr("id", opts.iframeId);
        divIframe.css("position", "absolute");
        divIframe.css("display", "none");
        divIframe.css("display", "block");
        divIframe.css("z-index", opts.iframeZIndex);
        divIframe.css("border");
        divIframe.css("top", "0");
        divIframe.css("left", "0");
        if (opts.width == 0) {
          divIframe.css("width", $myThis.width() + parseInt($myThis.css("padding")) * 2 + "px");
        }
        if (opts.height == 0) {
          divIframe.css("height", $myThis.height() + parseInt($myThis.css("padding")) * 2 + "px");
        }
        divIframe.css("filter", "mask(color=#fff)");
        $myThis.append(divIframe);
      });
    }
  }
  $.fn.decorateIframe.defaults = {
    iframeId: "decorateIframe1",
    iframeZIndex: -1,
    width: 0,
    height: 0
  }
  //放大镜视窗
  $("#bigView").decorateIframe();
  //点击到中图
  var midChangeHandler = null;
  $("#imageMenu li img").bind("click", function(){
    if ($(this).attr("id") != "onlickImg") {
      midChange($(this).parent().index());
      $("#imageMenu li").removeAttr("id");
      $(this).parent().attr("id", "onlickImg");
    }
  }).bind("mouseover", function(){
    if ($(this).attr("id") != "onlickImg") {
      window.clearTimeout(midChangeHandler);
      midChange($(this).parent().index());
    }
  }).bind("mouseout", function(){
    if($(this).attr("id") != "onlickImg"){
      $(this).removeAttr("style");
      midChangeHandler = window.setTimeout(function(){
        midChange($("#onlickImg img").parent().index());
      }, 1000);
    }
  });
  function midChange(ind) {
    $(".bigImg img").removeAttr("id");
    $(".bigImg").children('img').eq(ind).attr("id", "midimg");
    $("#midimg").show().siblings().hide()
    changeViewImg();
  }
  //大视窗看图
  function mouseover(e) {
    if ($("#winSelector").css("display") == "none") {
      $("#winSelector,#bigView").show();
    }
    $("#winSelector").css(fixedPosition(e));
    e.stopPropagation();
  }
  function mouseOut(e) {
    if ($("#winSelector").css("display") != "none") {
      $("#winSelector,#bigView").hide();
    }
    e.stopPropagation();
  }
  $('.bigImg').on('mouseover', '#midimg', mouseover)
  $('.bigImg').on('mousemove', '#midimg', mouseover)
  $('.bigImg').on('mouseout', '#midimg', mouseOut)
  $('.bigImg').on('mousemove', '#winSelector', mouseover)
  $('.bigImg').on('mouseout', '#winSelector', mouseOut)
  var $divWidth = $("#winSelector").width(); //选择器宽度
  var $divHeight = $("#winSelector").height(); //选择器高度
  var $imgWidth = $("#midimg").width(); //中图宽度
  var $imgHeight = $("#midimg").height(); //中图高度
  var $viewImgWidth = $viewImgHeight = $height = null; //IE加载后才能得到 大图宽度 大图高度 大图视窗高度
  function changeViewImg() {
    $("#bigView img").attr("src", $("#midimg").attr("src"));
  }
  changeViewImg();
  $("#bigView").scrollLeft(0).scrollTop(0);
  function fixedPosition(e) {
    if (e == null) {
      return;
    }
    var $imgLeft = $("#midimg").offset().left; //中图左边距
    var $imgTop = $("#midimg").offset().top; //中图上边距
    X = e.pageX - $imgLeft - $divWidth / 2; //selector顶点坐标 X
    Y = e.pageY - $imgTop - $divHeight / 2; //selector顶点坐标 Y
    X = X < 0 ? 0 : X;
    Y = Y < 0 ? 0 : Y;
    X = X + $divWidth > $imgWidth ? $imgWidth - $divWidth : X;
    Y = Y + $divHeight > $imgHeight ? $imgHeight - $divHeight : Y;
    if ($viewImgWidth == null) {
      $viewImgWidth = $("#bigView img").outerWidth();
      $viewImgHeight = $("#bigView img").height();
      if ($viewImgWidth < 200 || $viewImgHeight < 200) {
        $viewImgWidth = $viewImgHeight = 800;
      }
      // $height = $divHeight * $viewImgHeight / $imgHeight;
      // $("#bigView").width($divWidth * $viewImgWidth / $imgWidth);
      // $("#bigView").height($height);
      $("#bigView").width('500px');
      $("#bigView").height('500px');
    }
    var scrollX = X * $viewImgWidth / $imgWidth;
    var scrollY = Y * $viewImgHeight / $imgHeight;
    $("#bigView img").css({ "left": scrollX * -0.8, "top": scrollY * -0.8 });
    $("#bigView").css({ "top": 0, "left": $(".preview-wrap").width() });
    return { left: X, top: Y };
  }

  // 商品参数选择
  $('.choose-item').click(function(event) {
    if ($(this).attr('clickAble') === 'true') {
      if ($(this).attr('isSelected') === 'true') {
        $(this).removeClass('attr-selected');
        $(this).find('.icon-selected-rb').hide()
      } else {
        $(this).addClass('attr-selected').siblings().removeClass('attr-selected');
        $(this).siblings().find('.icon-selected-rb').hide()
        $(this).find('.icon-selected-rb').show()
        $('.s-attr' + $(this).parent().parent().index()).text($(this).text())
      }
      var attr_arr = []
      var attr_id = ''
      for (var i = 0; i < $('.attr-selected').length; i++) {
        attr_arr.push($('.attr-selected')[i].id)
      }
      attr_id = attr_arr.join()
      console.log(attr_id);
      window.location.href = "/mall/goods-detail?goods_id=" + $('#goodsObj').attr('goodsId') + '&attr_id=' + attr_id;
    }
  });

  // 商品详情导航
  $('.dt-tabbar-li').click(function(event) {
    $(this).addClass('dt-tabbar-selected').removeClass('dt-tabbar-hover').siblings().removeClass('dt-tabbar-selected');
    $('.main-page' + $(this).index()).show().siblings().hide();
  });

  $('.dt-tabbar-li').hover(function(event) {
    $(this).addClass('dt-tabbar-hover')
    $('.dt-tabbar-selected').removeClass('dt-tabbar-hover')
  },function(){
    $(this).removeClass('dt-tabbar-hover')
  });

  var tabbarFixed = false;
  var tabbarPosi = $('.dt-tabbar').offset().top;
  $(window).scroll(function(event) {
    var tbHeightNow = $(window).scrollTop();
    if (tbHeightNow > tabbarPosi) {
      $('.dt-tabbar').addClass('dt-tabbar-fixed');
      if (!tabbarFixed) {
        $('.tabbar-box').show();
        tabbarFixed = true;
      }
    } else {
      $('.dt-tabbar').removeClass('dt-tabbar-fixed');
      if (tabbarFixed) {
        $('.tabbar-box').hide();
        tabbarFixed = false;
      }
    }
  });

  // 将商品详情转为html
  $('.gs-dt-info').html($('.gs-dt-info').text())

  // 商品评价
  $('#goodsEvaluate').click(function(){
    $.ajax({
      url: '/mall/goods-evaluate',
      type: 'post',
      data: {
        // goods_id: $('#goodsObj').attr('goodsId')
        goods_id: 38
      },
      error: function(data, status, e) {
        console.log(data.readyState)
        console.log(e)
      },
      success: function(res) {
        console.log('获取评论', res);
        var eList = res.data.list
        var str = ''
        for(var i = 0; i < eList.length; i++) {
          str += '<div class="comment-item">' +
                   '<div class="user-info">' +
                     '<div class="user-img"><img src="/assets/images/goodsDetail/small02.png" width="40" height="40" alt="iphone7"/></div>' +
                     '<div class="user-name">' + eList[i].user_name + '</div>' +
                     '<div class="user-score">' + eList[i].credit_point + ' 分</div>' +
                   '</div>' +
                   '<div class="user-review">' +
                     '<div class="rev-stars">'
          for(var j = 0; j < eList[i].comment_star; j++) {
                str += '<i class="icon-star"></i>'
          }
              str += '</div>' +
                     '<div class="rev-datetime">' + eList[i].created_at + '</div>' +
                     '<div class="rev-attrs">' +
                       '<div class="attr-item">' +
                         '<span class="item-lab">所选参数：</span>' +
                         '<span class="item-val">' + eList[i].order_goods_detail.str_attr + '</span>' +
                       '</div>' +
                     '</div>' +
                     '<div class="rev-content">' + eList[i].comment_desc + '</div>' +
                     '<div class="rev-imgs">' +
                       '<ul class="img-list">'
          for(var k = 0; k < eList[i].comment_pics.length; k++) {
                  str += '<li><img src="' + eList[i].comment_pics[k] + '" width="50" height="50" alt=""/></li>'
          }
                str += '</ul>' +
                     '</div>'
          if (eList[i].comment_extra_desc || eList[i].comment_repay) {
              str += '<div class="summary-line" style="height: 1px;"></div>'
            if (eList[i].comment_extra_desc) {
              str += '<div class="extra-comment-label">购买7天后追评</div>' +
                     '<div class="extra-comment-content">' + eList[i].comment_extra_desc + '</div>'
            }
            if (eList[i].comment_repay) {
              str += '<div class="res-repay">' +
                       '<div class="repay-from">中国联通官方客服</div>' +
                       '<div class="repay-content">' + eList[i].comment_repay + '</div>' +
                       '<div class="repay-datetime">' + eList[i].repay_at + '</div>' +
                     '</div>'
            }
          }
            str += '</div>' +
                 '</div>'
          if (i < (eList.length - 1)) {
            str += '<div class="summary-line" style="height:1px;"></div>'
          }
        }
        $('.comment-body').html(str)
      }
    })
  });

  // 选择数量
  $('#subQuantity').attr('disabled', 'false');
  $('#addQuantity').click(function(event) {
    $('#quantity').val(parseInt($('#quantity').val()) + 1)
    if (parseInt($('#quantity').val()) > 1) {
      $('#subQuantity').attr('disabled', false);
    } else {
      $('#subQuantity').attr('disabled', true);
    }
  });
  $('#subQuantity').click(function(event) {
    $('#quantity').val(parseInt($('#quantity').val()) - 1)
    if (parseInt($('#quantity').val()) > 1) {
      $('#subQuantity').attr('disabled', false);
    } else {
      $('#subQuantity').attr('disabled', true);
    }
  });

  $('.itemInfo-wrap').click(function(event) {
    $('.sidebar-shopcar-add').hide()
  });

  // 立即购买
  $('#buyItNow').click(function(e){
    if ($('.attr-selected').length === $('.choose-attr').length && $('.choose-attr').length !== 0) {
      console.log('立即购买');
      const goodsObj = {
        product_id: $('#goodsObj').attr('productId'),
        goods_number: $('#quantity').val()
      }
      const goodsInfo = [goodsObj]
      const para = {
        json_data: JSON.stringify({ goods_info: goodsInfo })
      }
      $.ajax({
        url: '/buy/confirm-buy',
        type: 'post',
        data: para,
        success: function(res) {
          console.log('before /buy/submit-order', res);
          if (res) {
            window.location.href = "/buy/submit-order";
          }
        }
      });
    } else {
      $('.buy-form').addClass('choose-before-buy');
      $('.buy-btn-group').hide();
      $('.tips-without-attr').show();
    }
    e.stopPropagation();
  });

  // 加入购物车
  $('#addToCart').click(function(e){
    console.log('以选中个数', $('.attr-selected').length);
    console.log('必选参数个数', $('.choose-attr').length);
    if ($('.attr-selected').length === $('.choose-attr').length && $('.choose-attr').length !== 0) {
      console.log('加入购物车');
      const para = {
        goods_id: $('#goodsObj').attr('goodsId'),
        product_id: $('#goodsObj').attr('productId'),
        goods_number: $('#quantity').val(),
        goods_thumb: $('#goodsObj').attr('goodsThumb'),
        goods_img: $('#goodsObj').attr('goodsImg')
      }
      console.log(para);
      $.ajax({
        url: '/cart/add-to-cart',
        type: 'post',
        data: para,
        success: function(res) {
          console.log('加入购物车回调', res);
          if (res.code === 1) {
            var succInfo = $('#goodsName').text() + ' ' + $('.s-text').text()
            $('.sidebar-right-goodsName').text(succInfo)
            $('.sidebar-shopcar-add').show()
            var t = setTimeout("$('.sidebar-shopcar-add').hide()",3000)
          } else {
            window.location.href = "/member/login"
          }
        }
      });
    } else {
      $('.buy-form').addClass('choose-before-buy');
      $('.buy-btn-group').hide();
      $('.tips-without-attr').show();
    }
    e.stopPropagation();
  });

  // 关闭购买提示
  $('.close-buy-tips').on('click', function(){
    $('.buy-form').removeClass('choose-before-buy');
    $('.buy-btn-group').show();
    $('.tips-without-attr').hide();
  });
})
