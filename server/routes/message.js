'use strict';

import Router from 'koa-router';
import MessageController from '../controllers/MessageController';

const router = new Router();

router.get('/index', MessageController.index);

export default router;
