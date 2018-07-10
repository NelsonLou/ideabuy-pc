'use strict';

import {req, rsa} from '../config/request';

class DisputeController {

  static async returnStep1(ctx, next) {
    await ctx.render('./trade/dispute/return_step1', {title: '退款'});
  }

  static async returnStep1Action(ctx, next) {
    ctx.body = {
      "code": "1",
      "msg": "提交成功"
    };
  }

  static async returnStep2(ctx, next) {
    await ctx.render('./trade/dispute/return_step2', {
      type: '1',
      title: '退款'
    });
  }

  static async returnStep3(ctx, next) {
    await ctx.render('./trade/dispute/return_step3', {title: '退款'});
  }

  static async returnStep4(ctx, next) {
    await ctx.render('./trade/dispute/return_step4', {
      type: '2',
      title: '退款'
    });
  }

  static async evaluate(ctx, next) {
    await ctx.render('./trade/dispute/evaluate', {title: '评价'});
  }

  static async evaluateSuccess(ctx, next) {
    await ctx.render('./trade/dispute/evaluate_success', {title: '评价'});
  }

}

export default DisputeController;
