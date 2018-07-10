var resData = []  // 图片url数组
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
  var index = 0
  for (var i = 0; i < resData.length; i++) {
    if (resData[i].url === url) {
      index = i
    }
  }
  $.ajax({
    url: '/del-upload',
    type: 'post',
    data: {
      url: resData[index].sub_url
    }
  }).done(function() {
    resData.splice(index, 1);
    $(obj).parent().parent().siblings('.my-upload').show()
    $(obj).parent().remove()
  })
}

function appendImg(url, selector) {
  var img = '<div class="upload-img"><img class="del-upload-img" src="/assets/images/return/del-upload-img.png" onclick="delImg(this)"><img src="' + url + '" width="260" height="150"></div>'
  $(selector).append(img)
}


$(function() {
  var iframe = false;
  if ($.browser.msie && $.browser.version < 10) {
    iframe = true;
    console.log(iframe)
  }
  $('#fileuploadOne').fileupload({
    autoUpload: true,
    dataType: 'text',
    iframe: iframe,
    done: function(e, data) {
      resData.push({
        url: JSON.parse(data.result).url,
        sub_url: JSON.parse(data.result).form_url
      })
      $('#myuploadOne').hide()
      appendImg(JSON.parse(data.result).url, '.show-img-one');
      console.log('上传成功', resData);
    },
    fail: function(e, data) {
      console.log("上传失败");
    }
  });

  $('#fileuploadTwo').fileupload({
    autoUpload: true,
    dataType: 'text',
    iframe: iframe,
    done: function(e, data) {
      resData.push({
        url: JSON.parse(data.result).url,
        sub_url: JSON.parse(data.result).form_url
      })
      $('#myuploadTwo').hide()
      appendImg(JSON.parse(data.result).url, '.show-img-two');
      console.log('上传成功', resData);
    },
    fail: function(e, data) {
      console.log("上传失败");
    }
  });

  $('#fileuploadThree').fileupload({
    autoUpload: true,
    dataType: 'text',
    iframe: iframe,
    done: function(e, data) {
      resData.push({
        url: JSON.parse(data.result).url,
        sub_url: JSON.parse(data.result).form_url
      })
      $('#myuploadThree').hide()
      appendImg(JSON.parse(data.result).url, '.show-img-three');
      console.log('上传成功', resData);
    },
    fail: function(e, data) {
      console.log("上传失败");
    }
  });


  $('.act-disc-help').click(function(event) {
    $('.act-layer').show()
    $('.act-overlay').show()
  });

  $('.act-overlay-close').click(function(event) {
    $('.act-layer').hide()
    $('.act-overlay').hide()
  });

  $('#resClose').click(function(event) {
    $('.act-res-layer').hide()
    $('.act-res-overlay').hide()
  });
  $('#resAllright').click(function(event) {
    $('.act-res-layer').hide()
    $('.act-res-overlay').hide()
  });
});


// 提交表单
$('#formSubmit').click(function() {
  if(resData.length === 3){
    var urls = ''
    for (var i = 0; i < resData.length; i++) {
      urls += resData[i].sub_url
      if (i < resData.length-1) {
        urls += ','
      }
    }
    $.ajax({
      url: '/ious/upload-idcard',
      type: 'post',
      data: {
        file: urls
      },
      error: function(data, status, e) {
        console.log(data.readyState)
        console.log(e)
      },
      success: function(res) {
        console.log('身份证照片提交请求完成', res);
        if (res.code == 1) {
          window.location.href="/ious/set-deal-password"
        } else {
          $('.act-res-layer').show()
          $('.act-res-overlay').show()
          $('.act-overlay-window-msg').text(res.msg)
        }
      }
    })
  }
});
