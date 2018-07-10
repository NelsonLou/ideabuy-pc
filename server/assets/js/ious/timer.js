$(document).ready(function() {
  // 点击改变样式
  $('.staging-main-topChose li').click(function(event) {
    $(this).css({
          'border-color': '#FA9738',
          'color': '#FA9738'}).siblings()
          .css({
          'border-color': '#B1C3E1',
          'color': '#454545'});
  });
  // 时钟
  var intDiff = parseInt(1800);//倒计时总秒数量
  function timer(intDiff){
      window.setInterval(function(){
      var day=0,
          hour=0,
          minute=0,
          second=0;//时间默认值
      if(intDiff > 0){
          hour = Math.floor(intDiff / (60 * 60)) - (day * 24);
          minute = Math.floor(intDiff / 60) - (day * 24 * 60) - (hour * 60);
          second = Math.floor(intDiff) - (day * 24 * 60 * 60) - (hour * 60 * 60) - (minute * 60);
      }
      if (minute <= 9) minute = '0' + minute;
      if (second <= 9) second = '0' + second;
      $('.hour').html(hour);
      $('.minute').html(minute);
      $('.second').html(second);
      if(minute==0&&second==0){
        window.location.href = "/ious/my-ious";
      }
      intDiff--;
      }, 1000);
  }
  $(function(){
      timer(intDiff);
  });
});
