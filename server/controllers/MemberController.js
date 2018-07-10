'use strict';

import {req, rsa} from '../config/request';

class MemberController {

  // 用户登录页面
  static async login(ctx, next) {
    ctx.state.data = {
      title: '欢迎登录'
    };
  }

  // 获取登录二维码
  static async qrcodeLogin(ctx, next) {
    const rsp = await req(ctx, '/pc/getqruuid', 'post', rsa(ctx.request.body));

    ctx.body = rsp;
  }

  // 绑定登录二维码
  static async qrcodeBind(ctx, next) {
    const rsp = await req(ctx, '/pc/check-qruuid', 'post', rsa(ctx.request.body));

    if (rsp.code === 1) {
      ctx.session.user = rsp.data;
    }

    ctx.body = rsp;
  }

  // 用户注册页面
  static async register(ctx, next) {
    ctx.state.data = {
      title: '欢迎注册'
    };
  }

  // 用户注册
  static async registerAction(ctx, next) {
    if (ctx.session.captcha != ctx.request.body.verify_code) {
      console.log('验证码错误');
      ctx.body = {
        code: 10086,
        msg: '验证码错误'
      };
    } else {
      console.log('验证码通过');
      const rsp = await req(ctx, '/pc/user-register', 'post', rsa(ctx.request.body));

      if (rsp.code === 1) {
        ctx.session.user = rsp.data;
      }

      ctx.body = rsp;
    }
  }

  // 用户找密页面
  static async findPassword(ctx, next) {
    ctx.state.data = {
      title: '找回密码'
    };
  }

  // 校验短信验证码
  static async checkAllCode(ctx, next) {
    const rsp = await req(ctx, '/pc/check-allcode', 'post', rsa(ctx.request.body));

    ctx.body = rsp;
  }

  // 用户找密
  static async findPasswordAction(ctx, next) {
    if (ctx.session.captcha != ctx.request.body.verify_code) {
      console.log('验证码错误');
      ctx.body = {
        code: 10086,
        msg: '验证码错误'
      };
    } else {
      const rsp = await req(ctx, '/pc/user-forgot', 'post', rsa(ctx.request.body));

      ctx.body = rsp;
    }
  }
}

export default MemberController;
