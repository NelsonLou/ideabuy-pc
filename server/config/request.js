'use strict';

import request from 'koa2-request';
import NodeRSA from 'node-rsa';
import config from '../config';

// request 请求
export const req = async (ctx, url, method, body) => {
  let header = {
    'Accept': `application/vnd.ideabuy.v${config.app.apiVersion}+json`,
    'charset': 'UTF-8',
    'device': 'pc',
    'version': '1.0.0'
  };
  if (ctx.state.user) {
    header.Authorization = `Bearer ${ctx.state.user.token}`;
  }

  const opts = {
    url: config.app.apiUrl + url,
    method: method,
    headers: header,
    json: true,
    body: body
  };

  const rsp = await request(opts);

  return rsp.body;
}

// rsa 加密
export const rsa = (params) => {
  const key = new NodeRSA('-----BEGIN PUBLIC KEY-----\n' + 'MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC2lKZQbKOtHlFLnxche+sk6TUD\n' + '1lsMaCHuqbm0nFglN5RuZJBtpbmIKskqwrveYkzsL21FW2c7fhhvaMX7te59f+gk\n' + 'ukLo6Ltd4bCYXnXQlXJU8+J0ybBdLdsMP0qbtfQxXANlWoR0u403YTh242UcjvcD\n' + 'Hw7wLFOTgSz70Z8ZqwIDAQAB\n' + '-----END PUBLIC KEY-----');

  key.setOptions({encryptionScheme: 'pkcs1'});

  return {
    params: key.encrypt(JSON.stringify(params), 'base64')
  };
}
