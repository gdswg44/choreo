#!/bin/bash

NEZHA_KEY=${NEZHA_KEY:-'shuoming15487887'}

if [[ -n "${NEZHA_SERVER}" && -n "${NEZHA_KEY}" ]]; then
  echo "======================启动 NeZha======================"
NEZHA_PORT=${NEZHA_PORT:-'443'}
NEZHA_TLS=${NEZHA_TLS:-'1'}
[ "${NEZHA_TLS}" = "1" ] && TLS='--tls'

nohup /app/web/nez -s ${NEZHA_SERVER}:${NEZHA_PORT} -p ${NEZHA_KEY} ${TLS}  >/dev/null 2>&1 &

fi


# 启动 nginx

  echo "======================启动 nginx======================"
  echo ""
  echo "详细使用说明查看 ： ${SPACE_HOST}/shuoming"
  echo ""


nohup nginx -c /app/nginx.conf -g 'daemon off;' >/dev/null 2>&1 &



while true; do

  if [[ -n "${REP_PW}" ]]; then
  echo "======================replit保活程序开始运行!===================="
    python3 /app/replit.py
    sleep 10
  fi
  if [[ -n "${REP_PW2}" ]]; then
  echo "======================replit2保活程序开始运行!===================="
    python3 /app/replit2.py
    sleep 10
  fi
  if [[ -n "${REP_PW3}" ]]; then
  echo "======================replit3保活程序开始运行!===================="
    python3 /app/replit3.py
    sleep 10
  fi
  
done

