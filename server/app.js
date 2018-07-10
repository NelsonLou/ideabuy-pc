'use strict';

import Koa from 'koa';
import koaBasic from './config/basic';
import config from './config';
import routes from './routes';
import middleware from './middleware';

const app = new Koa();

// configure koa basic
koaBasic(app, config);

// configure middleware
app.use(middleware());

// configure routes
app.use(routes());

// configure listen port
app.listen(config.app.port);

console.log(config.app.apiUrl);

export default app;
