'use strict';

// passport 验证中间件
import passport from 'koa-passport';
// passport 本地策略中间件
import LocalStrategy from 'passport-local';

// 序列化 ctx.login() 触发
// serializeUser 在用户登录验证成功以后将会把用户的数据存储到 session 会话中
passport.serializeUser((user, done) => {
  // console.log('serializeUser: ', user);
  done(null, user);
});

// 反序列化（请求时，session中存在用户数据时触发）
// deserializeUser 在每次请求的时候将从 session 会话中读取用户对象
passport.deserializeUser((user, done) => {
  // console.log('deserializeUser: ', user);
  done(null, user);
});

// 提交数据(策略)
passport.use(new LocalStrategy((username, password, done) => {
  // console.log('LocalStrategy', username, password);
  const user = {
    username: username,
    password: password
  };
  done(null, user);
}));

export default passport;
