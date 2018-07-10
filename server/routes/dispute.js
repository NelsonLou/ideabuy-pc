'use strict';

import Router from 'koa-router';
import DisputeController from '../controllers/DisputeController';

const router = new Router();

router.get('/return-step1', DisputeController.returnStep1);
router.post('/return-step1', DisputeController.returnStep1Action);
router.get('/return-step2', DisputeController.returnStep2);
router.get('/return-step3', DisputeController.returnStep3);
router.get('/return-step4', DisputeController.returnStep4);
router.get('/evaluate', DisputeController.evaluate);
router.get('/evaluate-success', DisputeController.evaluateSuccess);

export default router;
