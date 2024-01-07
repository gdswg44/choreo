# Use the base image
FROM daxia2023/do:bhds

# Update package lists, upgrade existing packages, and install necessary packages
RUN apt-get update \
    && apt-get upgrade -y \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        passwd \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Check if group and user exist before creating them
RUN getent group 10016 || groupadd -g 10016 10016 \
    && getent passwd 10016 || useradd -u 10016 -g 10016 -m -s /bin/bash 10016 \
    && echo '10016:10016' | chpasswd \
    && usermod -aG sudo 10016 \
    && chown -R 10016:10016 /

# Switch to the non-root user
USER 10016

# Set the default command to run your entrypoint script
CMD ["/app/entrypoint.sh"]
