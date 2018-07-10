'use strict';

// generator 转换 async 语法 中间件
import convert from 'koa-convert';
// 跨域中间件
import cors from 'kcors';
// 解析 body 中间件
import bodyParser from 'koa-bodyparser';
// session 会话中间件
import session from 'koa-generic-session';
// sass 预处理中间件
import serveSass from 'koa.sass';
// 协助路由分发中间件
import mount from 'koa-mount';
// 静态文件服务中间件
import serveStatic from 'koa-static';
// 模板渲染中间件
import views from 'koa-views';
// 日志中间件
import Logger from 'koa-logger';
// import log4js from 'log4js';

// passport configure
import passport from './passport';

export default(app, config) => {

  app.proxy = true;

  app.use(cors(config.app.corsOpts));
  app.use(bodyParser());

  app.keys = config.app.sessionKeys;
  app.use(convert(session()));

  app.use(passport.initialize());
  app.use(passport.session());

  app.use(convert(Logger()));
  // log4js.configure(config.app.log4jsOpts);

  app.use(serveSass(config.app.sassOpts));
  app.use(mount(config.app.assetsPath, convert(serveStatic(config.app.assetsReal))));

  app.use(views(config.app.viewsPath, config.app.viewsOpts));

};
