
var imgArr = [];//上传图片数组
var uploadMaxLength = 3; //最大上传图片数量
var maxReturnMoney = $('#max-return-money').html();
var returnMoney = true; //还款金额是否通过校验

//ie8下添加indexof方法
if (!Array.prototype.indexOf) {
  Array.prototype.indexOf = function(elt) {
    var len = this.length >>> 0;
    var from = Number(arguments[1]) || 0;
    from = (from < 0)
      ? Math.ceil(from)
      : Math.floor(from);
    if (from < 0)
      from += len;
    for (; from < len; from++) {
      if (from in this && this[from] === elt)
        return from;
      }
    return -1;
  };
}
//删除图片
function delImg(obj) {
  var url = $(obj).siblings('img').attr('src')
  $.ajax({
    url: '/del-upload',
    type: 'post',
    data: {
      url: url.replace('http://ideabuy.oss-cn-hangzhou.aliyuncs.com/', '')
    }
  }).done(function() {
    imgArr.splice(imgArr.indexOf(url), 1);
    $(obj).parent().remove()
    if (imgArr.length < uploadMaxLength) {
      $('#myupload').removeClass('hidden');
    }
  })
}

$(document).ready(function() {
  //选择服务类型
  $("input:radio[name='serve_type']").change(function() {
    var val = $(this).val()
    if (val == '1') {
      $("input:radio[name='status']").parents('.form-cell').addClass('hidden')
      $(".tab-group").removeClass('hidden')
      $(".tab-group-1").addClass('hidden')
    } else {
      $("input:radio[name='status']").parents('.form-cell').removeClass('hidden')
      $(".tab-group-1").removeClass('hidden')
      $(".tab-group").addClass('hidden')
    }
  });

  //页面添加图片元素方法
  function appendImg(url) {
    var img = '<div class="upload-img"><img class="del-upload-img" src="/assets/images/return/del-upload-img.png" onclick="delImg(this)"><img src="' + url + '" width="100" height="100"></div>'
    $('.upload-img-container').append(img)
    imgArr.push(url);
  }

  //上传插件
  $(function() {
    var iframe = false;
    if ($.browser.msie && $.browser.version < 10) {
      iframe = true;
      console.log(iframe)
    }

    $('#fileupload').fileupload({
      autoUpload: true,
      dataType: 'text',
      iframe: iframe,
      done: function(e, data) {
        appendImg(JSON.parse(data.result).url);
        if (imgArr.length === uploadMaxLength) {
          $('#myupload').addClass('hidden');
        }
      },
      fail: function(e, data) {
        console.log("上传失败");
      },
      progressall: function(e, data) {
        var progress = parseInt(data.loaded / data.total * 100, 10);
        $('#progress .bar').css('width', progress + '%');
      }
    });
  });

  $("#return-money-input").blur(function() {
    $(this).next().removeClass('hidden')
    // var reg = /^(([0-9]+\\.[0-9]*[1-9][0-9]*)|([0-9]*[1-9][0-9]*\\.[0-9]+)|([0-9]*[1-9][0-9]*))$/
    if ($(this).val() === '') {
      $(this).next().html('不能为空！')
      returnMoney = false;
    }else if (isNaN($(this).val())) {
      $(this).next().html('格式错误！')
      returnMoney = false;
    }else {
      $(this).val(parseFloat($(this).val()).toFixed(2));
      if($(this).val()<=0){
        $(this).next().html('不能小于或者等于0！')
        returnMoney = false;
      } else if($(this).val()>parseFloat(maxReturnMoney)){
        $(this).next().html('不能大于最大退款金额！')
        returnMoney = false;
      }else{
        $(this).next().addClass('hidden');
      }
    }
  })

  //表单验证
  Validform.formCheck({
    valiContent: ".form",
    submitBtn: ".submit-btn",
    isAjax: true,
    valiType: "valiType",
    myCallback: function() {
      if(returnMoney === false) {
        return
      }
      $.ajax({
        url: '/dispute/return-step1',
        type: 'post',
        data: {
          param1: 'value1'
        }
      }).done(function() {
        console.log("success");
      })
    }
  });

})
