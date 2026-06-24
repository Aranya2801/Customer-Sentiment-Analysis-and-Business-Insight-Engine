# 📁 Project Structure

Complete directory tree and file descriptions for the Sentiment Intelligence Platform.

```
SentimentEngine/
├── 📄 README.md                     # Main documentation with badges & guides
├── 📄 LICENSE                       # MIT License
├── 📄 CONTRIBUTING.md               # Contribution guidelines
├── 📄 CHANGELOG.md                  # Version history
├── 📄 ROADMAP.md                    # Future development plans
├── 📄 SECURITY.md                   # Security policy
├── 📄 CODE_OF_CONDUCT.md            # Community standards
├── 📄 PROJECT_STRUCTURE.md          # This file
├── 📄 pyproject.toml                # Pytest, ruff, black, mypy config
├── 📄 requirements.txt              # Production dependencies (50+)
├── 📄 requirements-dev.txt          # Development dependencies
├── 📄 .env.example                  # Environment variable template
├── 📄 .gitignore                    # Git ignore rules
├── 📄 .pre-commit-config.yaml       # Pre-commit hooks
├── 📄 Dockerfile                    # Multi-stage Docker build
├── 📄 docker-compose.yml            # Full stack (8 services)
├── 📄 mkdocs.yml                    # Documentation site config
├── 📄 alembic.ini                   # Database migration config
│
├── 🐍 backend/                      # FastAPI Backend Application
│   ├── main.py                      # App entry point, middleware, routes
│   ├── api/
│   │   ├── routes/
│   │   │   ├── health.py            # /health, /health/ready, /health/live
│   │   │   ├── auth.py              # /auth/token, /auth/register
│   │   │   ├── sentiment.py         # /sentiment/analyze, /sentiment/batch
│   │   │   ├── emotion.py           # /emotion/detect, /emotion/batch
│   │   │   ├── churn.py             # /churn/predict
│   │   │   ├── insights.py          # /insights/analyze
│   │   │   ├── reports.py           # /reports/generate, /reports/types
│   │   │   ├── rag.py               # /rag/index, /rag/query, /rag/status
│   │   │   └── topics.py            # /topics/model, /topics/trends
│   │   └── middleware/
│   │       ├── rate_limiter.py      # Redis-based rate limiting
│   │       ├── request_id.py        # X-Request-ID injection
│   │       └── audit_log.py         # Request audit logging
│   ├── core/
│   │   ├── config.py                # Pydantic Settings (all env vars)
│   │   ├── database.py              # PostgreSQL async SQLAlchemy
│   │   ├── security.py              # JWT, password hashing, RBAC
│   │   └── redis_client.py          # Redis async client + cache helpers
│   ├── models/
│   │   └── db_models.py             # SQLAlchemy ORM models
│   ├── schemas/
│   │   └── schemas.py               # Pydantic request/response schemas
│   ├── services/
│   │   ├── rag_engine.py            # RAG: ChromaDB + InMemory + LLM
│   │   ├── genai_consultant.py      # GenAI business report generator
│   │   └── data_connectors.py       # Amazon, Yelp, Twitter, Reddit, Google
│   └── utils/
│       └── helpers.py               # Utility functions
│
├── 🧠 ml/                           # Machine Learning Models
│   ├── sentiment/
│   │   └── ensemble_analyzer.py     # 7-model ensemble + sarcasm detection
│   ├── emotion/
│   │   └── emotion_detector.py      # 8-emotion Plutchik + PAD model
│   ├── intent/
│   │   └── intent_detector.py       # Intent + urgency + escalation
│   ├── aspect/
│   │   └── absa_engine.py           # DeBERTa ABSA (8 business aspects)
│   ├── churn/
│   │   └── churn_predictor.py       # RF + XGBoost + LightGBM ensemble
│   ├── topics/
│   │   └── topic_modeler.py         # BERTopic + LDA + NMF comparison
│   ├── embeddings/                  # Sentence transformer utilities
│   ├── training/                    # Training scripts
│   ├── evaluation/                  # Model evaluation utilities
│   ├── online_learning/             # Streaming/incremental learning
│   └── registry/
│       └── saved/                   # Persisted model files (.pkl, .pt)
│
├── 🤖 agents/                       # Multi-Agent AI System
│   ├── coordinator/
│   │   └── agent_pipeline.py        # All 5 agents + CoordinatorAgent
│   ├── review_agent/                # ReviewAnalysisAgent
│   ├── trend_agent/                 # TrendDetectionAgent
│   ├── churn_agent/                 # ChurnAgent
│   ├── insight_agent/               # InsightGenerationAgent
│   └── report_agent/                # ExecutiveReportAgent
│
├── 📊 dashboard/                    # Streamlit Dashboard
│   ├── app.py                       # Main 10-page dashboard app
│   ├── pages/                       # Individual page modules
│   ├── components/                  # Reusable UI components
│   ├── utils/                       # Dashboard helper functions
│   └── assets/                      # Images, CSS, Lottie animations
│
├── 📦 data/                         # Data Storage
│   ├── raw/                         # Raw unprocessed reviews
│   ├── processed/                   # Cleaned & preprocessed data
│   ├── external/                    # External dataset files (HDFS, Yelp, etc.)
│   ├── sample/
│   │   └── generate_samples.py      # Synthetic dataset generator
│   └── embeddings/
│       └── chroma/                  # ChromaDB vector store persistence
│
├── 🧪 tests/                        # Test Suite (>90% coverage target)
│   ├── conftest.py                  # Shared fixtures
│   ├── unit/
│   │   ├── test_ml/
│   │   │   └── test_all_models.py   # 60+ tests for all ML models
│   │   ├── test_api/                # FastAPI route tests
│   │   └── test_agents/             # Agent pipeline tests
│   ├── integration/                 # Service integration tests
│   ├── e2e/                         # End-to-end tests
│   └── fixtures/                    # Test data fixtures
│
├── 📚 docs/                         # Documentation
│   ├── api/                         # API reference docs
│   ├── architecture/                # System design docs
│   ├── deployment/                  # Deployment guides (AWS, GCP, Railway)
│   ├── research/                    # Research notes & benchmarks
│   └── user_guide/                  # User manual
│
├── 🏭 mlops/                        # MLOps Infrastructure
│   ├── mlflow/
│   │   └── training_pipeline.py     # Full training + MLflow tracking
│   ├── dvc/                         # Data version control configs
│   └── monitoring/                  # Model drift monitoring
│
├── 🚀 scripts/                      # Utility Scripts
│   ├── data/
│   │   ├── download_datasets.py     # Download benchmark datasets
│   │   └── prepare_datasets.py      # Data preprocessing pipeline
│   ├── training/
│   │   └── train_churn_models.py    # Standalone churn training script
│   └── deployment/
│       └── deploy.sh                # Deployment automation script
│
├── 🌐 deployment/                   # Deployment Configurations
│   ├── docker/
│   │   └── nginx.conf               # Nginx reverse proxy config
│   ├── kubernetes/                  # K8s manifests
│   └── terraform/                   # Infrastructure as code
│
├── 📈 monitoring/                   # Observability
│   ├── prometheus/
│   │   └── prometheus.yml           # Prometheus scrape config
│   └── grafana/                     # Grafana dashboards
│
├── 🎨 assets/                       # Static Assets
│   ├── banners/
│   │   └── banner.svg               # Professional project banner
│   ├── diagrams/                    # Architecture diagrams
│   ├── screenshots/                 # Dashboard screenshots
│   └── mockups/                     # UI mockup files
│
└── 📁 .github/                      # GitHub Configuration
    ├── workflows/
    │   ├── ci.yml                   # Full CI/CD pipeline
    │   └── codeql.yml               # CodeQL security analysis
    ├── ISSUE_TEMPLATE/
    │   ├── bug_report.md
    │   └── feature_request.md
    └── PULL_REQUEST_TEMPLATE.md
```

## Key Design Decisions

### 1. Layered Architecture
- **API Layer** (FastAPI) → handles HTTP, auth, rate limiting
- **Service Layer** → business logic, orchestration
- **ML Layer** → pure ML models, no business logic
- **Agent Layer** → async AI orchestration
- **Data Layer** → DB, cache, vector store

### 2. ML Model Isolation
All ML models in `ml/` are completely independent of the web framework. They can be used standalone, tested independently, or deployed as separate services.

### 3. Graceful Degradation
Every ML component has a lightweight fallback:
- Transformers → VADER/TextBlob/Heuristics
- ChromaDB → In-memory search
- OpenAI → Ollama → Template-based reports
- MLflow → Local file logging

### 4. Async-First Design
All API routes and agents use `async/await`. The multi-agent coordinator runs Review Agent first, then Trend + Churn in parallel, minimizing total pipeline time.
