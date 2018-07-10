'use strict';

import compose from 'koa-compose';
import multer from 'koa-multer';
import Router from 'koa-router';

// 导入所有子路由
import MallRouter from './mall'; // 商城
import MemberRouter from './member'; // 登录注册找密
import IousRouter from './ious'; // 白条
import AccountRouter from './account'; // 个人中心
import OrderRouter from './order'; // 订单
import CartRouter from './cart'; // 购物车
import BuyRouter from './buy'; // 购买
import DisputeRouter from './dispute'; // 退款
import InvoiceRouter from './invoice'; // 发票
import MessageRouter from './message'; // 我的消息
import SecurityRouter from './security'; // 账号安全
import HelpRouter from './help'; // 帮助中心
import AuthRouter from './auth'; // 登录认证中间件
//引入控制器
import CommonController from '../controllers/CommonController'; // common
import HomeController from '../controllers/HomeController'; // home

const router = new Router();
// 装载所有子路由
router.use('/mall', MallRouter.routes(), MallRouter.allowedMethods()); // 商城路由
router.use('/member', MemberRouter.routes(), MemberRouter.allowedMethods()); // 登录注册找密路由
router.use('/ious', IousRouter.routes(), IousRouter.allowedMethods()); // 白条路由
router.use('/account', AccountRouter.routes(), AccountRouter.allowedMethods()); // 个人中心路由
router.use('/trade', OrderRouter.routes(), OrderRouter.allowedMethods()); // 订单路由
router.use('/cart', CartRouter.routes(), CartRouter.allowedMethods()); // 购物车路由
router.use('/buy', BuyRouter.routes(), BuyRouter.allowedMethods()); // 购买路由
router.use('/dispute', DisputeRouter.routes(), DisputeRouter.allowedMethods()); // 退款路由
router.use('/invoice', InvoiceRouter.routes(), InvoiceRouter.allowedMethods()); // 发票路由
router.use('/message', MessageRouter.routes(), MessageRouter.allowedMethods()); // 我的消息路由
router.use('/security', SecurityRouter.routes(), SecurityRouter.allowedMethods()); // 账号安全路由
router.use('/help', HelpRouter.routes(), HelpRouter.allowedMethods()); // 帮助中心路由
router.use('/auth', AuthRouter.routes(), AuthRouter.allowedMethods()); // 登录认证中间件

// 主路由
const upload = multer({dest: 'uploads/'}); // 文件上传配置项
router.post('/upload', upload.single('file'), CommonController.upload); // 文件上传
router.post('/del-upload', CommonController.delUpload); // 删除文件上传
router.post('/sms', CommonController.sms); // 短信验证码
router.get('/random', CommonController.random); // 图片验证码
router.get('/', HomeController.menu); // 首页路由

// 404 Not Found
router.get('*', async (ctx, next) => {
  await ctx.render('./common/pages/404', {
    title: 'Page Not Found!',
    content: 'The page you are looking for is not found!'
  });
});

export default() => compose([router.routes(), router.allowedMethods()]);
