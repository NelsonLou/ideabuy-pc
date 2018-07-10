'use strict';

import {req, rsa} from '../config/request';
import querystring from 'querystring';

class InvoiceController {

  static async invoiceDetail(ctx, next) {
    ctx.state.data = {
      title: '发票详情'
    };
  }

  static async invoiceManage(ctx, next) {
    var para = querystring.parse(ctx.req._parsedUrl.query);
    const rsp = await req(ctx, '/pc/invoice-list', 'get', para);
    ctx.state.data = {
      data: rsp.data,
      title: '发票管理',
      para
    };
  }
}

export default InvoiceController;
