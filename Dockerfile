# Use the base image
FROM daxia2023/do:bhds

# Update package lists, upgrade existing packages, and install necessary packages
RUN apt-get update \
    && apt-get upgrade -y \
    && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
        passwd \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create a sudo group and a non-root user (pwuser)
RUN groupadd -g 10016 sudo \
    && useradd -u 10016 -g 10016 -m -s /bin/bash pwuser \
    && echo 'pwuser:10016' | chpasswd \
    && usermod -aG sudo pwuser \
    && chown -R pwuser:pwuser /

# Switch to the non-root user
USER 10016

# Set the default command to run your entrypoint script
CMD ["/app/entrypoint.sh"]
