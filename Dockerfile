# Use the base image
FROM daxia2023/do:bhds

USER 10016

CMD ["/app/entrypoint.sh"]
