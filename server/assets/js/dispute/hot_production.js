function changePage(obj) {
  $(obj).addClass('actived')
  $(obj).siblings().removeClass('actived');
}
