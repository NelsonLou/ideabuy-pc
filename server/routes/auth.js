'use strict';

import Router from 'koa-router';
import {req, rsa} from '../config/request';
import passport from '../config/passport';

// 初始化路由
const router = new Router();

// 认证登录
router.post('/login', (ctx, next) => {
  // 调用策略
  return passport.authenticate('local', async (err, user, info, status) => {

    // 用户登录
    const rsp = await req(ctx, '/pc/user-login', 'post', rsa(ctx.request.body));
    ctx.login(rsp.data);

    // 购物车
    const cart = await req(ctx, '/pc/cart-list', 'post');
    ctx.session.cart = cart.data;
    // 白条状态
    const ious = await req(ctx, '/pc/user-getloginflag');
    ctx.session.ious = ious.data;

    ctx.body = {
      ...rsp,
      url: ctx.session.path
        ? ctx.session.path
        : '/'
    };

  })(ctx, next);
});

// 认证登出
router.get('/logout', (ctx, next) => {
  ctx.logout();
  ctx.redirect('/');
});

export default router;
