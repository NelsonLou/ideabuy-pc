'use strict';

import {req, rsa} from '../config/request';

class MessageController {

  static async index(ctx, next) {
    const rsp = await req(ctx, '/pc/announce-list');

    ctx.state.data = {
      ...rsp,
      title: '我的消息'
    };
  }

}

export default MessageController;
