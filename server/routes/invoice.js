'use strict';

import Router from 'koa-router';
import InvoiceController from '../controllers/InvoiceController';

const router = new Router();

router.get('/invoice-detail', InvoiceController.invoiceDetail);
router.get('/invoice-manage', InvoiceController.invoiceManage);

export default router;
