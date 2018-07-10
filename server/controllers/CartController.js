'use strict';

import {req} from '../config/request';

class CartController {

  // 加入购物车
  static async addToCart(ctx, next) {
    if (ctx.state.user) {
      const rsp = await req(ctx, '/pc/cart-add', 'post', ctx.request.body);
      ctx.body = rsp;
    } else {
      ctx.body = {
        code: 0
      };
    }
  }

  // 购物车
  static async cart(ctx, next) {
    const rsp = await req(ctx, '/pc/cart-list', 'post');
    ctx.session.cart = rsp.data;
    if (rsp.code === 1) {
      ctx.state.data = {
        title: '购物车'
      };
    }
  }

  // 购物车删除
  static async cartDelete(ctx, next) {
    const rsp = await req(ctx, '/pc/cart-del', 'post', ctx.request.body);
    ctx.body = rsp;
  }

}

export default CartController;
