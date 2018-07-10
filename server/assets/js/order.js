// 个人中心
$(function() {
  // 左边导航
  $(".option_list ul li").each(function(i){
    $(".option_list ul li").click(function(){
      $(this).addClass("OPlist_style").siblings().removeClass("OPlist_style")
    })
  })
  // 右边导航
  $(".RCont-option ul li").each(function(){
    $(".RCont-option ul li").click(function() {
      console.log($(this).find('span'))
      $(this).find('span').addClass("rigOp-sty")
      $(this).siblings().find('span').removeClass("rigOp-sty")
    });
  })
})
