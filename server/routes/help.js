'use strict';

import Router from 'koa-router';
import HelpController from '../controllers/HelpController';

const router = new Router();

router.get('/normal', HelpController.normal);

export default router;
