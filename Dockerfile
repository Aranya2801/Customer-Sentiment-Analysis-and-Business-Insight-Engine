# ================================================================
# Customer Sentiment Analysis Engine — Dockerfile
# Multi-stage build: builder → production → development
# ================================================================

FROM python:3.11-slim-bookworm AS builder

LABEL maintainer="Sentiment Engine Team"
LABEL version="2.0.0"

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential gcc g++ libpq-dev curl git \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /build

COPY requirements.txt .
RUN pip install --upgrade pip && \
    pip install --prefix=/install --no-cache-dir -r requirements.txt

# ── Production Stage ──────────────────────────────────────────────
FROM python:3.11-slim-bookworm AS production

RUN apt-get update && apt-get install -y --no-install-recommends \
    libpq5 curl ca-certificates tini \
    && rm -rf /var/lib/apt/lists/*

RUN groupadd -r sentiment && useradd -r -g sentiment -d /app sentiment

COPY --from=builder /install /usr/local

WORKDIR /app

COPY --chown=sentiment:sentiment backend/ ./backend/
COPY --chown=sentiment:sentiment ml/ ./ml/
COPY --chown=sentiment:sentiment agents/ ./agents/
COPY --chown=sentiment:sentiment dashboard/ ./dashboard/
COPY --chown=sentiment:sentiment config/ ./config/
COPY --chown=sentiment:sentiment scripts/ ./scripts/
COPY --chown=sentiment:sentiment data/sample/ ./data/sample/

RUN mkdir -p ml/registry/saved reports data/embeddings/chroma && \
    chown -R sentiment:sentiment /app

ENV PYTHONUNBUFFERED=1 \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONPATH=/app \
    PORT=8000 \
    WORKERS=4 \
    ENVIRONMENT=production

EXPOSE 8000 8501

HEALTHCHECK --interval=30s --timeout=10s --start-period=60s --retries=3 \
    CMD curl -sf http://localhost:${PORT}/api/v1/health/live || exit 1

USER sentiment
ENTRYPOINT ["/usr/bin/tini", "--"]
CMD ["uvicorn", "backend.main:app", "--host", "0.0.0.0", "--port", "8000", "--workers", "4"]

# ── Development Stage ─────────────────────────────────────────────
FROM production AS development

USER root
RUN apt-get update && apt-get install -y --no-install-recommends git vim && \
    rm -rf /var/lib/apt/lists/*
COPY requirements-dev.txt .
RUN pip install --no-cache-dir -r requirements-dev.txt
USER sentiment
CMD ["uvicorn", "backend.main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
