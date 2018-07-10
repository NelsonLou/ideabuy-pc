$(document).ready(function() {
  $('.index-switch').click(function() {
    $(this).addClass('active').siblings().removeClass('active');
  });
});
