var imgArr = [];
var uploadMaxLength = 3;
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
  $(".btn-right").click(function() {
    $(".step3-main").addClass('hidden')
    $(".step3-form").removeClass('hidden')
  })

  function appendImg(url) {
    var img = '<div class="upload-img"><img class="del-upload-img" src="/assets/images/return/del-upload-img.png" onclick="delImg(this)"><img src="' + url + '" width="100" height="100"></div>'
    $('.upload-img-container').append(img)
    imgArr.push(url);
  }

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

  //表单验证
  Validform.formCheck({
    valiContent: ".step3-form",
    submitBtn: ".submit-btn",
    isAjax: true,
    myCallback: function() {
      $.ajax({
        url: '/dispute/return-step1',
        type: 'post',
        data: {
          param1: 'value1'
        }
      }).done(function() {
        $(".step3-main").removeClass('hidden')
        $(".step3-form").addClass('hidden')
      })
    }
  });

})
