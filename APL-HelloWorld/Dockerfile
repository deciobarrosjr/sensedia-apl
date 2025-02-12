FROM python:3.12-slim-bookworm
RUN apt-get update && apt-get install -y --no-install-recommends dumb-init
RUN pip install --no-cache-dir Flask gunicorn

WORKDIR /app
RUN addgroup --system appuser && useradd -r -s /bin/false -g appuser appuser
RUN chown -R appuser:appuser /app
USER appuser

RUN pip install --no-cache-dir Flask gunicorn

COPY . .

CMD ["dumb-init", "python", "app.py"]

EXPOSE 8080