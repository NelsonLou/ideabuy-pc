'use strict';

import Router from 'koa-router';
import OrderController from '../controllers/OrderController';

const router = new Router();

router.get('/order/detail', OrderController.detail);
router.get('/order/lists', OrderController.lists);
router.post('/order/lists-sure', OrderController.listsSure);
router.post('/order/lists-del', OrderController.listsDel);
router.post('/order/lists-pay', OrderController.listsPay);
// router.get('/order/wait-pay', OrderController.waitPay);
// router.get('/order/wait-send', OrderController.waitSend);
// router.get('/order/wait-confirm', OrderController.waitConfirm);
// router.get('/order/wait-rate', OrderController.waitRate);

export default router;
