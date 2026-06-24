# Security Policy

## Supported Versions

| Version | Supported |
|---------|-----------|
| 2.x     | ✅ Active support |
| 1.x     | ❌ End of life |

## Reporting a Vulnerability

**Do NOT open public GitHub issues for security vulnerabilities.**

Please email security@your-org.com with:
1. Description of the vulnerability
2. Steps to reproduce
3. Potential impact
4. Suggested fix (if any)

We will respond within 48 hours and aim to patch critical issues within 7 days.

## Security Best Practices

- Always set `SECRET_KEY` to a random 32+ character string in production
- Never commit `.env` files with real API keys
- Use environment variables for all sensitive configuration
- Enable Redis password in production (`REDIS_PASSWORD`)
- Use PostgreSQL SSL connections in production
- Rotate API keys regularly
- Monitor audit logs for suspicious access patterns
