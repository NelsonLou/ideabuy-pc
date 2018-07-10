'use strict';

import {req, rsa} from '../config/request';
import querystring from 'querystring';

class MallController {

  // 商品详情
  static async goodsDetail(ctx, next) {
    const para = querystring.parse(ctx.req._parsedUrl.query);
    // console.log('输出para--------------------------', para);
    const rsp = await req(ctx, '/pc/goods-detail', 'get', rsa(para));
    // console.log('获取商品详情-------------------------> ', rsp)
    if (rsp.code === 1) {
      // console.log('goods_detail-------------------------> ', rsp.data.goods_detail)
      ctx.state.data = {
        title: '商品详情',
        content: rsp.data
      };
    } else {
      ctx.redirect('back');
    }
  }
  // 商品评价
  static async goodsEvaluate(ctx, next) {
    const para = ctx.request.body;
    // console.log('goodsEvaluate输出para--------------------------', para);
    const rsp = await req(ctx, '/pc/comment-list-product', 'get', rsa(para));
    // console.log('获取商品评价-------------------------> ', rsp)
    ctx.body = rsp;
  }

  // 获取订单信息
  static async getOrderData(ctx, next) {
    ctx.body = ctx.session.orderData;
  }

  // 支付成功
  static async paySuccess(ctx, next) {
    ctx.state.data = {
      title: '支付结果'
    };
  }
  // 支付失败
  static async payFail(ctx, next) {
    ctx.state.data = {
      title: '支付结果'
    };
  }

  // 添加地址
  static async addAddress(ctx, next) {
    const para = ctx.request.body;
    // console.log('添加地址----------', para);
    const rsp = await req(ctx, '/pc/user-addressadd', 'post', para);
    ctx.body = rsp;
  }

  // 设置默认地址
  static async setDefaultAddress(ctx, next) {
    const para = ctx.request.body;
    // console.log('设置默认地址----------', para);
    const rsp = await req(ctx, '/pc/user-addressdefault', 'post', para);
    ctx.body = rsp;
  }

  // 获取地址
  static async getAddress(ctx, next) {
    const para = ctx.request.body;
    // console.log('获取地址-------------------', para);
    const rsp = await req(ctx, '/pc/user-addressdetail', 'get', para);
    ctx.body = rsp;
  }

  // 编辑地址
  static async editAddress(ctx, next) {
    const para = ctx.request.body;
    // console.log('编辑地址----------', para);
    const rsp = await req(ctx, '/pc/user-addressedit', 'post', para);
    // console.log(rsp);
    ctx.body = rsp;
  }

  // 删除地址
  static async deleteAddress(ctx, next) {
    const para = ctx.request.body;
    // console.log('删除地址----------', para);
    const rsp = await req(ctx, '/pc/user-addressdelete', 'post', para);
    ctx.body = rsp;
  }

  // 商品列表
  static async goodsList(ctx, next) {
    var para = querystring.parse(ctx.req._parsedUrl.query);
    const rsp = await req(ctx, '/pc/goods-list', 'get', para);
    ctx.state.data = {
      title: '商品列表',
      data: rsp.data,
      para
    };
  }
}
export default MallController;
