FROM daxia2023/do:bhds

RUN apt-get install -y --no-install-recommends passwd \
    && group_exists=$(getent group sudo) \
    && if [ -z "$group_exists" ]; then groupadd sudo; fi \
    && echo 'pwuser:10016' | chpasswd \
    && usermod -aG sudo pwuser \
    && chown -R pwuser:pwuser / 2>/dev/null || true

USER 10016

CMD ["/app/entrypoint.sh"]
