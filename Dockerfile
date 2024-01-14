FROM daxia2023/do:bhds

RUN apt-get update && apt-get install -y --no-install-recommends \
    passwd \
    && rm -rf /var/lib/apt/lists/* \
    && getent group sudo || groupadd sudo \
    && useradd -m pn -u 10016 \
    && echo 'pn:10016' | chpasswd \
    && usermod -aG sudo pn \
    && chown -R pn:pn / 2>/dev/null || true

USER 10016
