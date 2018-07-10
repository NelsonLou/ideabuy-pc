'use strict';

import Router from 'koa-router';
import MemberController from '../controllers/MemberController';

const router = new Router();

// 用户登录
router.get('/login', MemberController.login);
router.post('/qrcode', MemberController.qrcodeLogin);
router.post('/qrcodeBind', MemberController.qrcodeBind);

// 用户注册
router.get('/register', MemberController.register);
router.post('/register', MemberController.registerAction);

// 用户找密
router.get('/find-password', MemberController.findPassword);
router.post('/find-password', MemberController.findPasswordAction);
router.post('/check-allcode', MemberController.checkAllCode);

export default router;
