'use strict';

import {req, rsa} from '../config/request';

class IousController {
  // 我的白条首页
  static async ious(ctx, next) {
    const rsp = await req(ctx, '/pc/user-whiteindex', 'get');
    ctx.state.data = {
      ...rsp,
      title: '我的白条'
    };
  }
  // 白条账单分期
  static async staging(ctx, next) {
    ctx.state.data = {
      title: '分期'
    };
  }
  // 白条还款
  static async payBack(ctx, next) {
    ctx.state.data = {
      title: '还款'
    };
  }
  // 白条支付成功
  static async paySuccess(ctx, next) {
    ctx.state.data = {
      title: '还款'
    };
  }

  static async identification(ctx, next) {
    const rsp = await req(ctx, '/pc/user-getloginflag');
    ctx.session.ious = rsp.data;
    console.log('identification获取用户状态 ', rsp);
    if (rsp.code === 1) {
      if (rsp.data.status == 2) {
        ctx.redirect('/ious/my-ious');
      } else if (rsp.data.status == 3) {
        ctx.state.data = {
          title: '身份验证'
        };
      } else {
        if (rsp.data.is_idcard !== 1) {
          ctx.state.data = {
            title: '身份验证'
          };
          console.log('---------go to render');
        } else if (rsp.data.is_idcard_img !== 1) {
          ctx.redirect('/ious/upload-idcard');
        }
      }
    } else {
      ctx.redirect('/member/login');
    }
  }
  static async uploadIDCard(ctx, next) {
    ctx.state.data = {
      title: '激活白条'
    };
  }
  static async setDealPassword(ctx, next) {
    const ious = await req(ctx, '/pc/user-getloginflag');
    ctx.session.ious = ious.data;
    ctx.state.data = {
      title: '设置交易密码'
    };
  }
  static async bindBankCard(ctx, next) {
    const rsp = await req(ctx, '/pc/user-realname');
    // console.log('获取姓名 ', rsp.data)
    ctx.state.data = {
      title: '绑定银行卡',
      content: rsp.data
    };
  }
  static async emergencyContact(ctx, next) {
    ctx.state.data = {
      title: '紧急联系人'
    };
  }
  static async completeCredit(ctx, next) {
    ctx.state.data = {
      title: '完成授信额度'
    };
  }

  // 身份证添加表单
  static async identifyAction(ctx, next) {
    const para = ctx.request.body;
    // console.log('添加身份证 ', para)
    const rsp = await req(ctx, '/pc/user-editidcard', 'post', rsa(para));
    // console.log('身份证添加表单请求完成 ', rsp)
    ctx.body = rsp;
  }

  // 身份证照片上传表单
  static async uploadIDAction(ctx, next) {
    const para = ctx.request.body;
    // console.log('上传身份证 ', para)
    const rsp = await req(ctx, '/pc/user-editidimg', 'post', rsa(para));
    // console.log('上传身份证请求完成 ', rsp)
    ctx.body = rsp;
  }

  // 设置交易密码表单
  static async setDealPwdAction(ctx, next) {
    const para = ctx.request.body;
    // console.log('设置交易密码 ', para)
    const rsp = await req(ctx, '/pc/user-setpaypwd', 'post', rsa(para));
    // console.log('设置交易密码请求完成 ', rsp)
    ctx.body = rsp;
  }

  // 绑定银行卡表单
  static async bindBankAction(ctx, next) {
    const para = ctx.request.body;
    // console.log('添加银行卡 ', para)
    const rsp = await req(ctx, '/pc/user-bankadd', 'post', rsa(para));
    // console.log('添加银行卡请求完成 ', rsp)
    ctx.body = rsp;
  }

  // 设置紧急联系人表单
  static async setContactAction(ctx, next) {
    const para = ctx.request.body;
    // console.log('添加联系人 ', para)
    const rsp = await req(ctx, '/pc/userlink-add', 'post', rsa(para));
    // console.log('添加联系人请求完成 ', rsp)
    ctx.body = rsp;
  }
}
export default IousController;
