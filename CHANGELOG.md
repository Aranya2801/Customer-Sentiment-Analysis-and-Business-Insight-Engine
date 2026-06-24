# Changelog

All notable changes to the Sentiment Intelligence Platform are documented here.
Format follows [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).

---

## [2.0.0] - 2024-12-01 — Major Release

### Added
- Multi-model sentiment ensemble (RoBERTa + DistilBERT + VADER + TextBlob)
- 8-emotion Plutchik wheel detection (DistilRoBERTa-based)
- Intent & urgency classification (7 intent categories, 4 urgency levels)
- Aspect-Based Sentiment Analysis (ABSA) for 8 business dimensions
- Sarcasm detection with confidence scoring
- Churn Prediction Engine (Random Forest + XGBoost + LightGBM)
- BERTopic + LDA + NMF topic modeling with coherence comparison
- RAG System with ChromaDB vector store and LLM answer generation
- 5-agent AI pipeline (Review, Trend, Churn, Insight, Report agents)
- GenAI Business Consultant (CEO, Risk, CX, Strategy, Growth reports)
- 10-page Streamlit dashboard with dark SaaS theme
- FastAPI backend with full Swagger documentation
- MLflow experiment tracking and model versioning
- Docker Compose deployment with 8 services
- GitHub Actions CI/CD pipeline
- Data connectors for Amazon, Yelp, Twitter, Reddit, Google Places
- Synthetic dataset generator (reviews + churn data)

### Changed
- Upgraded to Python 3.11 and PyTorch 2.1
- Migrated to Pydantic v2 for settings management
- Redesigned dashboard with modern dark theme

### Fixed
- N/A (new release)

---

## [1.0.0] - 2024-06-01 — Initial Release

### Added
- Basic sentiment analysis with VADER
- Simple Streamlit dashboard (3 pages)
- CSV upload functionality
- BERT-based classification
