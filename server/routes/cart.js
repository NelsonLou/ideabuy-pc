'use strict';

import Router from 'koa-router';
import CartController from '../controllers/CartController';

const router = new Router();

router.post('/add-to-cart', CartController.addToCart); // 加入购物车
router.get('/list', CartController.cart); // 购物路由
router.post('/delete', CartController.cartDelete); // 购物车删除路由

export default router;
