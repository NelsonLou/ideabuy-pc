'use strict';

import {req, rsa} from '../config/request';

class SecurityController {

  // 帐号安全索引页面
  static async index(ctx, next) {
    ctx.state.data = {
      title: '账号安全'
    };
  }

  // 修改登录密码页面
  static async passwdReset(ctx, next) {
    ctx.state.data = {
      title: '设置登入密码'
    };
  }

  // 修改登录密码
  static async passwdResetAction(ctx, next) {
    const rsp = await req(ctx, '/pc/user-changepassword', 'post', rsa(ctx.request.body));

    ctx.body = rsp;
  }

  // 修改交易密码页面
  static async paymentPwd(ctx, next) {
    ctx.state.data = {
      title: '设置交易密码'
    };
  }

  // 修改交易密码
  static async paymentPwdAction(ctx, next) {
    const rsp = await req(ctx, '/pc/user-editpaypwd', 'post', rsa(ctx.request.body));

    ctx.body = rsp;
  }

}

export default SecurityController;
