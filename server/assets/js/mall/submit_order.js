var addrStr = ''
var receStr = ''
$( function() {
  // 默认选择
  $('.delivery-time .select-opt').eq(0).addClass('o-selected').find('.icon-selected-rb').show();
  $('.divide .select-opt:last').addClass('o-selected').find('.icon-selected-rb').show();
  $('.d-pay-item').eq(1).addClass('p-selected').find('.d-radio').attr('checked', 'true');
  // 用来看页面json 可删除
  $.ajax({
    url: '/mall/get-order-data',
    type: 'get',
    success: function(res) {
      console.log('get-order-data', res);
    }
  });
  // ==================

  // 默认收货地址显示
  console.log('默认收货地址显示', $('.default-addr'));
  if ($('.default-addr').length) {
    addrStr = $('.default-addr').siblings('.addr-content').children('span').eq(1).text()
    receStr = $('.default-addr').siblings('.addr-content').children('span').eq(0).text() + ' ' + $(this).siblings('.addr-content').children('span').eq(2).text()
    $('.total_address').text(addrStr)
    $('.total_consignee').text(receStr)
  }

  // 收货地址展开收起
  $('.show-addr-list').click(function(event) {
    if ($(this).find('span').text() === '更多地址') {
      $('.address-list').slideDown()
      $(this).find('span').text('收起地址');
      $('.arrow').removeClass('arrow-down').addClass('arrow-up')
    } else {
      $('.address-list').slideUp()
      $(this).find('span').text('更多地址')
      $('.arrow').removeClass('arrow-up').addClass('arrow-down')
    }
  });
  $('.address-list').on('mouseover', '.addr-item', mouseOverAddr)
  function mouseOverAddr(e) {
    $(this).addClass('addr-selected');
    $(this).find('.edit-addr').show();
  }
  $('.address-list').on('mouseout', '.addr-item', mouseOutAddr)
  function mouseOutAddr(e) {
    $(this).removeClass('addr-selected');
    $(this).find('.edit-addr').hide();
  }
  // 选择收货地址
  $('.address-list').on('click', '.addr-item', function(event) {
    addrStr = $(this).children('.addr-content').children('span').eq(1).text()
    receStr = $(this).children('.addr-content').children('span').eq(0).text() + ' ' + $(this).children('.addr-content').children('span').eq(2).text()
    $('.total_address').text(addrStr)
    $('.total_consignee').text(receStr)
    $(this).find('input').attr('checked', 'true')
  });

  // 下拉框
  $('#logistics').focus(function() {
    $('#selectLogistics').slideDown()
  }).blur(function() {
    $('#selectLogistics').slideUp()
  })
  $('#selectLogistics li').stop().click(function  (e) {
    e.stopPropagation();
    $("#logistics").val($(this).text());
    $(this).parents('#selectLogistics').slideUp();
  })

  // 打钩的单选
  $('.select-opt').click(function(){
    $(this).addClass('o-selected').siblings().removeClass('o-selected');
    $(this).siblings().find('.icon-selected-rb').hide()
    $(this).find('.icon-selected-rb').show()
    if ($(this).text() == '个人') {
      $('#iTitle').attr('placeholder', '请输入个人姓名')
      $('.personal-info').show()
      $('.company-info').hide()
      $('#iTitle').val('')
      $('#iCode').val('')
    }
    if ($(this).text() == '单位') {
      $('#iTitle').attr('placeholder', '请输入单位姓名')
      $('.company-info').show()
      $('#iTitle').val('')
    }
    if ($(this).attr('divide') === 'false') {
      $('#payId2').show();
      $('#payId3').show();
      $('#submitPay').text('提交并支付');
    }
    if ($(this).attr('divide') === 'true') {
      $('#payId1').addClass('p-selected').siblings().removeClass('p-selected');
      $('#payId1').find('.d-radio').attr('checked', 'true');
      $('#payId2').hide();
      $('#payId3').hide();
      $('#submitPay').text('确认分期');
    }
  })

  // 选择支付方式
  $('.d-pay-item').click(function(){
    $(this).addClass('p-selected').siblings().removeClass('p-selected');
    $(this).find('.d-radio').attr('checked', 'true');
  })

  // 开发票
  $('#needInvoice').click( function () {
    if ($(this).attr('class') === 'd-checked') {
      $(this).removeClass('d-checked')
      $('#iTitle').val('')
      $('#iCode').val('')
    } else {
      $('.s-o-layer').show();
      $('.s-o-overlay').show();
      $('.s-o-invoice-window').show()
    }
  })

  // 发票弹窗
  $('#iSave').click(function(){
    $('.s-o-layer').hide();
    $('.s-o-overlay').hide();
    $('.s-o-invoice-window').hide()
    $('#needInvoice').addClass('d-checked')
  })
  $('#iCancel').click(function(){
    $('.s-o-layer').hide()
    $('.s-o-overlay').hide()
    $('.s-o-invoice-window').hide()
    $('#iTitle').val('')
    $('#iCode').val('')
  })
  $('#iClose').click(function(){
    $('.s-o-layer').hide()
    $('.s-o-overlay').hide()
    $('.s-o-invoice-window').hide()
    $('#iTitle').val('')
    $('#iCode').val('')
  })

  // 地址弹窗
  var addOrEdit = true;
  var addressId = null;
  // 添加地址
  $('.add-address').click(function(){
    $('#aPhone').removeClass('a-error')
    $('.s-o-layer').show();
    $('.s-o-overlay').show();
    $('.s-o-address-window').show()
    $('.addr-title').text('添加收货人信息')
    $('#distpicker').distpicker({
      province: '',
      city: '',
      district: ''
    });
    $('#aUsername').val('')
    $('#aPhone').val('')
    $('#aAddress').val('')
    addOrEdit = true;
  });
  // 删除地址
  $('.edit-addr').on('click', '.delete-btn', function(event) {
    event.preventDefault();
    $.ajax({
      url: '/mall/delete-address',
      type: 'post',
      data: {
        address_id: $(this).parent().parent().attr('id')
      },
      success: res => {
        console.log('请求成功', res);
        if (res.code) {
          if ($(this).parent().siblings('input').attr('checked') == 'checked') {
            $('.total_address').text('')
            $('.total_consignee').text('')
          }
          $(this).parent().parent().remove();
        }
      }
    });
  });
  // 设置默认地址
  $('.edit-addr').on('click', '.set-btn', function(event) {
    event.preventDefault();
    $.ajax({
      url: '/mall/set-default-address',
      type: 'post',
      data: {
        address_id: $(this).parent().parent().attr('id')
      },
      success: function(res) {
        console.log('请求成功', res);
        location.reload(true);
      }
    });
  });
  // 获取编辑地址
  $('.edit-addr').on('click', '.edit-btn', function(event) {
    event.preventDefault();
    $('#aPhone').removeClass('a-error')
    addOrEdit = false;
    addressId = $(this).parent().parent().attr('id')
    $('#aSave').attr('addrId', 'a' + addressId);
    $.ajax({
      url: '/mall/get-address',
      type: 'post',
      data: {
        address_id: addressId
      },
      success: function(res) {
        console.log('获取详细地址', res);
        $('#distpicker').distpicker({
          province: res.data.address_info.province_name,
          city: res.data.address_info.city_name,
          district: res.data.address_info.district_name
        });
        $('#aSave').attr('userId', res.data.address_info.user_id);
        $('#aSave').attr('addressId', res.data.address_info.address_id);
        $('.addr-title').text('编辑收货人信息')
        $('#aUsername').val(res.data.address_info.consignee)
        $('#aPhone').val(res.data.address_info.mobile)
        $('#aAddress').val(res.data.address_info.address)
        $('.s-o-layer').show();
        $('.s-o-overlay').show();
        $('.s-o-address-window').show()
      }
    });
  });
  // 保存修改
  $('#aSave').click(function(){
    var mobileReg = /^13[0-9]{9}|14[0-9]{9}|15[0-9]{9}|17[0-9]{9}|18[0-9]{9}$/;
    if (mobileReg.test($("#aPhone").val())) {
      $('#aPhone').removeClass('a-error')
      $('.s-o-layer').hide();
      $('.s-o-overlay').hide();
      $('.s-o-address-window').hide()
      var para = {}
      var url = ''
      if (addOrEdit) {
        para = {
          consignee: $('#aUsername').val(),
          mobile: $('#aPhone').val(),
          province: $('#province').val(),
          city: $('#city').val(),
          district: $('#district').val(),
          address: $('#aAddress').val()
        }
        url = '/mall/add-address'
      } else {
        para = {
          address_id: $('#aSave').attr('addressId'),
          user_id: $('#aSave').attr('userId'),
          consignee: $('#aUsername').val(),
          mobile: $('#aPhone').val(),
          province: $('#province').val(),
          city: $('#city').val(),
          district: $('#district').val(),
          address: $('#aAddress').val()
        }
        url = '/mall/edit-address'
      }
      console.log(para);
      $.ajax({
        url: url,
        type: 'post',
        data: para,
        success: function(res) {
          console.log('请求成功', res);
          if (res.code) {
            // location.reload(true);
          }
        }
      });
    } else {
      console.log('验证手机号');
      $('#aPhone').addClass('a-error')
    }
  })
  // 关闭弹窗
  $('#aClose').click(function(){
    $('.s-o-layer').hide();
    $('.s-o-overlay').hide();
    $('.s-o-address-window').hide()
  })

  // 提交并支付
  $('#submitPay').click(function(event) {
    if (!$('.address-list input:radio:checked').val()) {
      console.log('请先选择收货地址！');
      $('.alert-icon').addClass('icon-fail')
      $('.alert-text').text('请先选择收货地址')
      $('.my-alert-box').show()
      var t = setTimeout(function() {
        $('.my-alert-box').hide()
        $('.alert-icon').removeClass('icon-fail')
      }, 2000)
      return
    }
    var para = {
      order_info: {},
      goods_info: []
    }
    para.order_info = {
      address_id: $('.address-list input:radio:checked').val(),
      shipping_name: $('#logistics').val(),
      shipping_time: $('.delivery-time .o-selected').attr('shippingTime'),
      pay_id: $('.d-pay-select .p-selected input:radio:checked').val(),
      month: $('.divide .o-selected').attr('typeName'),
      order_from: 1,
      loan_product_id: $('.divide .o-selected').attr('typeName') == '0' ? 2 : 1,
      invoice_type: $('#needInvoice').attr('class') == 'd-checked' ? $('.i-select .o-selected').attr('iType') : '',
      invoice_title: $('#iTitle').val(),
      invoice_code: $('#iCode').val()
    }
    for (let i = 0; i < $('.goods-item').length; i++) {
      para.goods_info.push({
        product_id: $($('.goods-item')[i]).attr('prodId'),
        goods_number: $($('.goods-item')[i]).attr('goodsNum')
      });
    }
    console.log('添加订单', para);
    $.ajax({
      url: '/buy/add-order-confirm',
      type: 'post',
      data: {
        para: JSON.stringify(para)
      },
      success: function(res1) {
        console.log('添加订单', res1);
        // if (res1.code) {
        //   $.ajax({
        //     url: '/buy/go-to-pay',
        //     type: 'post',
        //     data: {
        //       order_sn: res1.data.order_sn
        //     },
        //     success: function(res2) {
        //       window.location = res2.data.url;
        //     }
        //   });
        // } else {
        //   $('.alert-icon').addClass('icon-fail')
        //   $('.alert-text').text(res1.msg)
        //   $('.my-alert-box').show()
        //   var t = setTimeout(function(){
        //     $('.my-alert-box').hide()
        //     $('.alert-icon').removeClass('icon-fail')
        //   },2000)
        // }
      }
    });
  });

})
