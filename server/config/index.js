'use strict';

import path from 'path';
import lodash from 'lodash';

let env = process.env.NODE_ENV || 'development';

// configure log4js
// let log4jsOptions = {

// };

// configure basic
let basic = {
  app: {
    root: path.normalize(path.join(__dirname, '/..')),
    env: env,
    apiVersion: '1',
    corsOpts: {
      credentials: true
    },
    sessionKeys: ['session-key'],
    sassOpts: {
      mountAt: '/assets/css',
      src: './server/assets/css',
      dest: './dist/css/'
    },
    assetsPath: '/assets',
    assetsReal: __dirname + '/../assets',
    viewsPath: __dirname + '/../views',
    viewsOpts: {
      extension: 'swig'
    },
    aliOssOpts: {
      region: 'oss-cn-hangzhou',
      accessKeyId: 'LTAIXijUalhN321o',
      accessKeySecret: 'd0ouwDjnRV7CpG5M1EptbAIhnYJQlD',
      bucket: 'ideabuy'
    }
    // log4jsOpts: log4jsOptions
  }
};

let specific = {
  development: {
    app: {
      apiUrl: 'http://i.d.weknet.cn',
      port: 3000
    }
  },
  testing: {
    app: {
      apiUrl: 'http://i.t.weknet.cn',
      port: 6000
    }
  },
  production: {
    app: {
      apiUrl: 'http://i.weknet.cn',
      port: 6000
    }
  }
};

export default lodash.merge(basic, specific[env]);
