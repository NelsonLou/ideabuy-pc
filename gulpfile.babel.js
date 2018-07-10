'use strict';

import gulp from 'gulp';
import browserSync from 'browser-sync';
import nodemon from 'gulp-nodemon';

gulp.task('nodemon', cb => {

  let started = false;

  return nodemon({script: './main.js'}).on('start', () => {
    // 为了避免 nodemon 开始多次
    if (!started) {
      cb();
      started = true;
    }
  });

});

gulp.task('default', ['nodemon'], () => {

  browserSync.init({
    files: [
      './server/public/assets/**/*.*', './server/views/**/*.*', './server/routes/**/*.*', './server/controllers/**/*.*'
    ],
    proxy: 'http://localhost:3000', // 注意这里要换成你在 koa2 中设定的 服务端口 一般是3000
    port: 7000,
    open: 'local'
  });

});
