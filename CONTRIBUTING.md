# Contributing to Sentiment Intelligence Platform

Thank you for your interest in contributing! This is a research-grade, production-ready project and we maintain high standards.

## Development Setup

```bash
git clone https://github.com/your-org/SentimentEngine.git
cd SentimentEngine
python -m venv .venv && source .venv/bin/activate
pip install -r requirements.txt -r requirements-dev.txt
pre-commit install
cp .env.example .env
```

## Branch Strategy

| Branch | Purpose |
|---|---|
| `main` | Production releases only |
| `develop` | Active development integration |
| `feature/name` | New features |
| `fix/issue-name` | Bug fixes |
| `research/topic` | Experimental ML work |

## Code Standards

- Python 3.11+ with full type hints
- Black formatting (line length 100)
- Ruff linting
- Docstrings on all public functions (Google style)
- Test coverage ≥ 80% for new code

```bash
# Before committing
ruff check . --fix
black .
pytest tests/ -v --cov=backend --cov=ml
```

## Adding a New ML Model

1. Create `ml/your_category/your_model.py`
2. Implement standard interface: `analyze(text) -> Result` and `analyze_batch(texts) -> List[Result]`
3. Add to ensemble in `ml/sentiment/ensemble_analyzer.py` if applicable
4. Write tests in `tests/unit/test_ml/`
5. Update API route if needed
6. Add Streamlit visualization page
7. Document in `docs/`

## Adding a New Data Connector

1. Create class in `backend/services/data_connectors.py`
2. Implement `fetch()` and `fetch_mock()` methods
3. Return `List[RawReview]` objects
4. Add connector to `ReviewDataCollector`
5. Write tests with mock data

## Pull Request Requirements

- [ ] Tests written and passing
- [ ] Code linted (ruff + black)
- [ ] Docstrings updated
- [ ] README updated if adding features
- [ ] No secrets committed
- [ ] PR description explains changes

## Commit Message Format

```
type(scope): Short description

Longer description if needed.

Refs: #issue
```

Types: `feat`, `fix`, `docs`, `test`, `refactor`, `perf`, `ml`, `data`

## Security Issues

Do NOT open public issues for security vulnerabilities.
Email: security@your-org.com with full details.
