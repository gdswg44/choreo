FROM daxia2023/do:replit
RUN apt-get update && apt-get install -y --no-install-recommends \
    passwd \
    && rm -rf /var/lib/apt/lists/* \
    && getent group sudo || groupadd sudo \
    && useradd -m pn -u 10014 \
    && echo 'pn:10014' | chpasswd \
    && usermod -aG sudo pn \
    && chown -R pn:pn / 2>/dev/null || true

USER 10014
COPY entrypoint.sh /app/

CMD ["/app/entrypoint.sh"]
