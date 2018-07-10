'use strict';

import Router from 'koa-router';
import AccountController from '../controllers/AccountController';

const router = new Router();

// 个人信息
router.get('/profile', AccountController.profile); // 个人信息页面
router.post('/profile', AccountController.profileAction); // 编辑个人信息
// 银行卡管理
router.get('/bank-manage', AccountController.bankManage); // 银行卡管理页面
router.get('/bind-bank', AccountController.bindBank); // 绑定银行卡页面
router.post('/bind-bank', AccountController.bindBankAction); // 绑定银行卡
router.post('/delete-bank', AccountController.bankDelete); // 删除银行卡
// 地址管理
router.get('/delivery-address', AccountController.deliveryAddress); // 收货地址管理页面
router.get('/add-address', AccountController.addAddress); // 新增编辑收货地址页面
router.post('/add-address', AccountController.addAddressAction); // 新增编辑收货地址
router.post('/del-address', AccountController.delAddressAction); // 删除收货地址
router.post('/def-address', AccountController.defAddressAction); // 设置默认收货地址
// 我的优惠券
router.get('/coupon', AccountController.coupon);

export default router;
