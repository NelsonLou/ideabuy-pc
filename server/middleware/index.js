'use strict';

import compose from 'koa-compose';

import checkAuth from './checkAuth';

export default() => compose([checkAuth]);
