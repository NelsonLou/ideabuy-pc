'use strict';

import Router from 'koa-router';
import IousController from '../controllers/IousController';

const router = new Router();

router.get('/my-ious', IousController.ious); // 我的白条
router.get('/staging', IousController.staging); // 分期
router.get('/pay-back', IousController.payBack); //还款支付
router.get('/pay-success', IousController.paySuccess); // 还款成功

router.get('/identification', IousController.identification);
router.post('/identification', IousController.identifyAction);

router.get('/upload-idcard', IousController.uploadIDCard);
router.post('/upload-idcard', IousController.uploadIDAction);

router.get('/set-deal-password', IousController.setDealPassword);
router.post('/set-deal-password', IousController.setDealPwdAction);

router.get('/bind-bank-card', IousController.bindBankCard);
router.post('/bind-bank-card', IousController.bindBankAction);

router.get('/emergency-contact', IousController.emergencyContact);
router.post('/emergency-contact', IousController.setContactAction);

router.get('/complete-credit', IousController.completeCredit);

export default router;
