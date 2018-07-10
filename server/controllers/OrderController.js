'use strict';

import {req, rsa} from '../config/request';
import querystring from 'querystring';

class OrderController {

  static async detail(ctx, next) {
    var para = querystring.parse(ctx.req._parsedUrl.query);
    const rsp = await req(ctx, '/pc/order-detail', 'get', para);
    ctx.state.data = {
      data: rsp.data,
      title: '订单详情',
      para
    };
  }
  static async lists(ctx, next) {
    var para = querystring.parse(ctx.req._parsedUrl.query);
    const rsp = await req(ctx, '/pc/order-list', 'get', para);
    ctx.state.data = {
      data: rsp.data,
      title: '订单列表',
      para
    };
  }
  static async listsSure(ctx, next) {
    var para = ctx.request.body;
    console.log('---------listsSure', para);
    const rsp = await req(ctx, '/pc/order-finish', 'post', para);
    console.log('---------listsSure', rsp);
    ctx.body = rsp;
  }
  static async listsDel(ctx, next) {
    var para = ctx.request.body;
    console.log('---------listsDel', para);
    const rsp = await req(ctx, '/pc/order-delete', 'post', para);
    console.log('---------listsDel', rsp);
    ctx.body = rsp;
  }

  // 立即支付
  static async listsPay(ctx, next) {
    var para = ctx.request.body;
    const rsp = await req(ctx, '/pc/alipay', 'post', para);
    ctx.body = rsp;
  }

}

export default OrderController;
