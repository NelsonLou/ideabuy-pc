'use strict';

export default async (ctx, next) => {
  // 匹配免认证路径
  const hasAuthPath = /mall|member|random|sms|auth|upload|del-upload/.test(ctx.url);
  // 存储来路路径
  ctx.session.path = /member|auth|cart/.test(ctx.url)
    ? ctx.session.path
    : ctx.url;

  // 判断认证是否通过
  if (ctx.isAuthenticated() || hasAuthPath || ctx.path == '/') {
    let curPath; // 菜单激活路径
    // 判断白条是否激活
    if (!hasAuthPath && ctx.path != '/' && !/ious|cart/.test(ctx.path) && ctx.session.ious.status === 0) {
      // 未激活返回白条激活页
      ctx.redirect('/ious/identification');
    } else {
      // 判断个人中心菜单激活
      if (/\/order|\/dispute/.test(ctx.path)) {
        curPath = '/trade/order/lists';
      } else if (/bank/.test(ctx.path)) {
        curPath = '/account/bank-manage';
      } else if (/address/.test(ctx.path)) {
        curPath = '/account/delivery-address';
      } else if (/security/.test(ctx.path)) {
        curPath = '/security/index';
      } else {
        curPath = ctx.path;
      }
    }

    // next middleware
    await next();

    // 渲染 Swig 模板
    if (ctx.state.data) {
      console.log('swig:', ctx.state.data);
      if (ctx.state.data.code === 11095) {
        ctx.redirect('/member/login');
      } else {
        await ctx.render(`.${ctx.path}`, {
          ...ctx.state.data,
          user_info: ctx.state.user,
          user_nav_cur: curPath,
          cart: ctx.session.cart,
          ious: ctx.session.ious
        });
      }
    }
  } else {
    if (ctx.path == '/buy/confirm-buy') {
      ctx.session.buyPara = ctx.request.body;
    }
    ctx.redirect('/member/login');
  }
}
