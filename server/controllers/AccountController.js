'use strict';

import {req, rsa} from '../config/request';
import querystring from 'querystring';

class AccountController {

  // 个人信息页面
  static async profile(ctx, next) {
    const rsp = await req(ctx, '/pc/userinfo-detail');

    ctx.state.data = {
      ...rsp,
      title: '个人信息'
    };
  }

  // 编辑个人信息
  static async profileAction(ctx, next) {
    const rsp = await req(ctx, '/pc/userinfo-add', 'post', rsa(ctx.request.body));

    ctx.body = rsp;
  }

  // 银行卡管理页面
  static async bankManage(ctx, next) {
    const rsp = await req(ctx, '/pc/user-banklist');

    ctx.state.data = {
      ...rsp,
      title: '银行卡管理'
    };
  }

  // 绑定银行卡页面
  static async bindBank(ctx, next) {
    const rsp = await req(ctx, '/pc/user-realname');

    ctx.state.data = {
      ...rsp,
      title: '添加银行卡'
    };
  }

  // 绑定银行卡
  static async bindBankAction(ctx, next) {
    const rsp = await req(ctx, '/pc/user-bankadd', 'post', rsa(ctx.request.body));

    ctx.body = rsp;
  }

  // 删除银行卡
  static async bankDelete(ctx, next) {
    const rsp = await req(ctx, '/pc/user-bankdelete', 'post', rsa(ctx.request.body));

    ctx.body = rsp;
  }

  // 收货地址管理页面
  static async deliveryAddress(ctx, next) {
    const rsp = await req(ctx, '/pc/user-addresslist');

    ctx.state.data = {
      ...rsp,
      title: '地址管理'
    };
  }

  // 新增编辑收货地址页面
  static async addAddress(ctx, next) {
    const params = querystring.parse(ctx.req._parsedUrl.query);
    const rsp = await req(ctx, '/pc/user-addressdetail', 'get', rsa({address_id: params.id}));

    ctx.state.data = {
      ...rsp,
      title: params.id
        ? '编辑收货地址'
        : '新增收货地址'
    };
  }

  // 新增编辑收货地址
  static async addAddressAction(ctx, next) {
    const url = ctx.request.body.address_id
      ? '/pc/user-addressedit'
      : '/pc/user-addressadd';
    const rsp = await req(ctx, url, 'post', rsa(ctx.request.body));

    ctx.body = rsp;
  }

  // 删除收货地址
  static async delAddressAction(ctx, next) {
    const rsp = await req(ctx, '/pc/user-addressdelete', 'post', rsa(ctx.request.body));

    ctx.body = rsp;
  }

  // 设置默认收货地址
  static async defAddressAction(ctx, next) {
    const rsp = await req(ctx, '/pc/user-addressdefault', 'post', rsa(ctx.request.body));

    ctx.body = rsp;
  }

  // 我的优惠券
  static async coupon(ctx, next) {
    ctx.state.data = {
      title: '我的优惠券'
    };
  }

}

export default AccountController;
