
FROM daxia2023/do:bhds

RUN apt-get update && \
    adduser --uid 10016 myuser && \
    chown -R myuser:myuser /app && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*


USER 10016


CMD ["/app/entrypoint.sh"]
