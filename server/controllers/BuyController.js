'use strict';

import {req} from '../config/request';

class BuyController {
  // 确认订单
  static async confirmBuy(ctx, next) {
    ctx.session.buyPara = ctx.request.body;
    ctx.body = 1;
  }

  // 结算页
  static async submitOrder(ctx, next) {
    const para = ctx.session.buyPara;
    // console.log('submitOrder输出para------------------------->', para);
    const rsp = await req(ctx, '/pc/order-confirm', 'post', para);
    // console.log('提交订单页面-------------------------> ', rsp);
    // console.log('goods_list-------------------------> ', rsp.data.store_list[0].goods_list);
    ctx.session.orderData = rsp.data;
    ctx.state.data = {
      title: '提交订单',
      content: rsp.data
    };
  }

  // 确认并支付
  static async addOrder(ctx, next) {
    // console.log('-----------addOrder-----------', ctx.request.body);
    const para = {
      json_data: ctx.request.body.para
    };
    // console.log('addOrder输出para------------------------->', para);
    const rsp = await req(ctx, '/pc/order-add', 'post', para);
    ctx.body = rsp;
  }

  // 调起支付宝
  static async goToPay(ctx, next) {
    const para = ctx.request.body;
    const rsp = await req(ctx, '/pc/alipay', 'post', para);
    ctx.body = rsp;
  }
}

export default BuyController;
