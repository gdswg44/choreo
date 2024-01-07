FROM daxia2023/do:bhds

# Update package lists and install necessary packages
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    passwd && \
    groupadd -g 10016 sudo && \
    useradd -u 10016 -g 10016 -m -s /bin/bash pwuser && \
    echo 'pwuser:10016' | chpasswd && \
    usermod -aG sudo pwuser && \
    chown -R pwuser:pwuser /

USER 10016
CMD ["/app/entrypoint.sh"]
