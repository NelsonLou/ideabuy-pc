'use strict';

import Router from 'koa-router';
import BuyController from '../controllers/BuyController';

const router = new Router();

router.post('/confirm-buy', BuyController.confirmBuy); // 提交订单页面
router.get('/submit-order', BuyController.submitOrder); // 提交订单页面
router.post('/add-order-confirm', BuyController.addOrder); // 添加订单
router.post('/go-to-pay', BuyController.goToPay); // 支付调起

export default router;
