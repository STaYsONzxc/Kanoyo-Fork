# syntax=docker/dockerfile:1

FROM python:3.10-bullseye

EXPOSE 7865

WORKDIR /app

VOLUME [ "/app/logs/weights", "/app/opt" ]

CMD ["python3", "infer-web.py"]