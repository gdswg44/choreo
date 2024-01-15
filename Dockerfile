FROM daxia2023/choreo:v5
RUN apk update \
    && apk add --no-cache bash curl shadow \
    && useradd -m pn -u 10016 \
    && groupadd sudo \
    && echo 'pn:10016' | chpasswd \
    && usermod -aG sudo pn \
    && chown -R pn:pn / 2>/dev/null || true \
    && rm -rf /var/lib/apt/lists/*

USER 10016

# 使用 PM2 启动应用程序并持续显示日志
CMD node index.js

