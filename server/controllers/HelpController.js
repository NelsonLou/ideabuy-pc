'use strict';

import {req, rsa} from '../config/request';

class HelpController {

  static async normal(ctx, next) {
    ctx.state.data = {
      title: '帮助中心'
    };
  }
}

export default HelpController;
