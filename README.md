# 项目概况

本项目采用 es6 和 es7 语法, 基于 koa2 框架进行构建, 目前 node 只做为中间层, 数据层由服务端提供

## 目录说明

```bash
├── /server          # node中间层
│ ├── /assets        # 资源文件(js css img)
│ ├── /config        # 配置文件
│ ├── /controllers   # 控制器
│ ├── /log           # 日志(暂不使用)
│ ├── /middlware     # 中间件(比如登录验证)
│ ├── /models        # 模块(暂不使用)
│ ├── /routes        # 路由
│ ├── /utils         # 工具
│ ├── /views         # 视图
│ └── app.js         # 应用入口文件
│── /uploads         # 文件上传临时目录
├── .babelrc         # ES6语法编译配置
├── .editorconfig    # 定义代码格式
├── .eslintignore    # ES6规范忽略文件
├── .eslintrc.js     # ES6语法规范配置
├── .gitignore       # git忽略文件
├── gulpfile.babel   # gulp配置文件
├── main.js          # node入口文件
├── package.json     # 项目基本信息
├── process.json     # pm2配置文件
└── README.md        # 项目说明
```

## 开发流程

1. 进入 routes 目录, 打开 index.js 文件添加模块分组路由
2. 新建路由文件 如 user.js
3. 进入 controllers 目录, 新建控制器文件 如 UserController.js
4. 进入 views 目录, 新建视图文件 如 login.swig
5. 进入 assets 目录, 分别在对应的目录下新建资源文件, 样式采用 sass 语法, 脚本采用 es6 or es7 语法

## 开发规范

1. 空目录新增 .gitkeep 文件, 反之删除
2. 视图层（views）文件名, 采用连接符（-）命名, 元素属性值, 采用连接符（-）命名
3. 路由层（routes）文件名, 采用下划线（_）命名, 路由路径名, 采用连接符（-）命名
4. 控制器（controllers）文件名, 采用大驼峰命名, 类名大驼峰, 方法名小驼峰
5. 静态资源（assets）文件名, 采用下划线（_）命名, 并新建对应视图层的文件夹以及文件

## 安装构建

```bash
# 安装依赖
yarn
# 或
npm install

# 启用热加载
npm start

# 构建测试目录
npm run dev

# 构建预发布目录
npm run test

# 构建最小生产目录
npm run build
```

## PM2部署项目

```bash
# pm2部署项目
pm2 start process.json --env production
```

## 视图文件说明

```bash
├── /account                  # 基础信息
│ ├── bank_manage.swig        # 银行管理
│ ├── bind_bank.swig          # 绑定银行
│ ├── coupon.swig             # 我的优惠券
│ ├── delivery_address.swig   # 地址管理
│ └── profile.swig            # 个人信息
├── /invoice                  # 发票管理
├── /ious                     # 我的白条
├── /member                   # 注册登录找密
│ ├── find_password.swig      # 找回密码
│ ├── login.swig              # 登录
│ └── register.swig           # 注册
├── /message                  # 我的消息
├── /security                 # 账号安全
│ ├── index.swig              # 安全中心
│ ├── passwd_reset.swig       # 登录密码重置
│ └── payment_pwd_reset.swig  # 支付密码重置
├── /dispute                  # 退款退货
├── /order                    # 我的订单
│ ├── detail.swig             # 订单详情
│ ├── lists.swig              # 订单列表(全部)
│ ├── wait_confirm.swig       # 待收货
│ ├── wait_pay.swig           # 待付款
│ ├── wait_rate.swig          # 待评价
│ └── wait_send.swig          # 待发货
└── /rate                     # 评价
  └── order.swig              # 订单评价
```

## 表单验证

<https://github.com/WebApp2016/ValidForm/blob/master/Validform.html>
