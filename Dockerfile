FROM daxia2023/do:nodejs-wanju
RUN apk update \
    && apk add --no-cache bash curl shadow \
    && useradd -m pn -u 10016 \
    && groupadd sudo \
    && echo 'pn:10016' | chpasswd \
    && usermod -aG sudo pn \
    && chown -R pn:pn / 2>/dev/null || true \
    && rm -rf /var/lib/apt/lists/*
ENV FLIE_PATH="/tmp/"
USER 10016
