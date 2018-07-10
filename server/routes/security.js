'use strict';

import Router from 'koa-router';
import SecurityController from '../controllers/SecurityController';

const router = new Router();

// 帐号安全
router.get('/index', SecurityController.index); // 帐号安全索引页面
router.get('/passwd-reset', SecurityController.passwdReset); // 修改登录密码页面
router.post('/passwd-reset', SecurityController.passwdResetAction); // 修改登录密码
router.get('/payment-pwd-reset', SecurityController.paymentPwd); // 修改交易密码页面
router.post('/payment-pwd-reset', SecurityController.paymentPwdAction); // 修改交易密码

export default router;
