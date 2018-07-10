'use strict';

import captchapng from 'captchapng';
import fs from 'fs';
import co from 'co';
import OSS from 'ali-oss';
import config from '../config';

const client = new OSS(config.app.aliOssOpts);

class ToolUtil {

  // static isObject(data) {
  //   if (typeof data == 'object') {
  //     return true;
  //   }
  //   return false;
  // }

  // 生成 base64 图片验证码
  static captchaPng(ctx) {
    const captcha = parseInt(Math.random() * 9000 + 1000); // numeric captcha
    const vcode = new captchapng(80, 30, captcha); // width,height,numeric captcha
    vcode.color(0, 0, 0, 0); // First color: background (red, green, blue, alpha)
    vcode.color(80, 80, 80, 255); // Second color: paint (red, green, blue, alpha)

    ctx.session.captcha = captcha; // save session

    return `data:image/jpg;base64,${vcode.getBase64()}`; // image captcha path;
  }

  // 添加文件上传
  static addFile(ctx) {
    return new Promise((resolve) => {
      const {originalname, path} = ctx.req.file;
      // 文件路径
      const filePath = `./${path}`;
      // 文件类型
      const temp = originalname.split('.');
      const fileType = temp[temp.length - 1];
      const lastName = `.${fileType}`;
      // 构建图片名
      const fileName = Date.now() + lastName;
      // 图片重命名
      fs.rename(filePath, fileName, err => {
        if (err) {
          console.log(err);
        } else {
          const localFile = `./${fileName}`;
          const key = fileName;
          // 阿里云 OSS 上传文件
          co(function* () {
            const result = yield client.put(`pc-uploads/${key}`, localFile);
            // console.log(result.url);
            // const imageSrc = result.name;
            return result;
          }).then(function(value) {
            // 上传之后删除本地文件
            fs.unlinkSync(localFile);
            resolve(value);
          }, function(err) {
            console.error(err.stack);
            // 上传之后删除本地文件
            fs.unlinkSync(localFile);
          });
        }
      });
    });
  }

  // 删除文件上传
  static delFile(key) {
    return new Promise((resolve) => {
      co(function* () {
        const result = yield client.delete(key);
        // console.log(result.url);
        // const imageSrc = result.name;
        return result;
      }).then(function(value) {
        resolve(value);
      }, function(err) {
        console.error(err.stack);
      });
    });
  }

}

export default ToolUtil;
