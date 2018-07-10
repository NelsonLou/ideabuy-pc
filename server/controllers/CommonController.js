'use strict';

import {req, rsa} from '../config/request';
import ToolUtil from '../utils/ToolUtil';

class CommonController {

  // 上传文件
  static async upload(ctx, next) {
    let url,
      form_url;
    await ToolUtil.addFile(ctx).then((value) => {
      url = value.url;
      form_url = value.name;
    });

    ctx.body = {
      'code': '1',
      'url': url,
      'form_url': form_url
    };
    ctx.response.header['content-type'] = 'text/html;charset=utf-8';
  }

  // 删除上传文件
  static async delUpload(ctx, next) {
    await ToolUtil.delFile(ctx.request.body.url).then(value => {
      ctx.body = {
        'code': '1',
        'msg': '操作成功'
      };
    });
  }

  // 图片验证码
  static async random(ctx, next) {
    const imgPath = ToolUtil.captchaPng(ctx);

    ctx.body = {
      path: imgPath
    };
  }

  // 短信验证码
  static async sms(ctx, next) {
    const url = ctx.request.body.mobile
      ? '/pc/sms-send'
      : '/pc/user-sendsms';
    const rsp = await req(ctx, url, 'post', rsa(ctx.request.body));

    ctx.body = rsp;
  }

}

export default CommonController;
