'use strict';

import Router from 'koa-router';
import MallController from '../controllers/MallController';

const router = new Router();

router.get('/goods-list', MallController.goodsList); // 商品列表
router.get('/goods-detail', MallController.goodsDetail); // 商品详情
router.post('/goods-evaluate', MallController.goodsEvaluate); // 商品评价
router.get('/get-order-data', MallController.getOrderData); // 获取訂單信息
router.post('/add-address', MallController.addAddress); // 添加地址
router.post('/get-address', MallController.getAddress); // 获取地址
router.post('/edit-address', MallController.editAddress); // 编辑地址
router.post('/delete-address', MallController.deleteAddress); // 删除地址
router.post('/set-default-address', MallController.setDefaultAddress); // 删除地址
router.get('/pay-success', MallController.paySuccess); // 付款成功
router.get('/pay-fail', MallController.payFail); // 付款失败

export default router;
