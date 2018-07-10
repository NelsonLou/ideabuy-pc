'use strict';

import {req} from '../config/request';

class HomeController {

  static async menu(ctx, next) {
    // 商品列表
    const rsp_menu = await req(ctx, '/pc/goodscategory-list');
    // 用户白条
    const rsp_ious = await req(ctx, '/pc/user-whiteindex');

    if (rsp_menu.code === 1) {
      ctx.state.data = {
        menu: rsp_menu.data,
        ious: rsp_ious.data,
        title: '银行卡管理'
      };
    }
  }

}

export default HomeController;
