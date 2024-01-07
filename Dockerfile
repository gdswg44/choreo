FROM daxia2023/do:bhds
RUN apt-get update && apt-get install -y --no-install-recommends \
    passwd   \
    && getent group sudo  groupadd sudo \
    && echo 'pwuser:10016' | chpasswd \
    && usermod -aG sudo pwuser \
    && chown -R pwuser:pwuser / 2>/dev/null  true

USER 10016
CMD ["/app/entrypoint.sh"]

