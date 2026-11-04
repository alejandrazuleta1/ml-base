FROM python:3.11-slim

WORKDIR /app

# Instalar dependencias primero (aprovecha la caché de Docker)
COPY pyproject.toml README.md ./
COPY src ./src
RUN pip install --no-cache-dir .

# Usuario sin privilegios
RUN useradd -m appuser
USER appuser

EXPOSE 8000
CMD ["uvicorn", "ml_base.api:app", "--host", "0.0.0.0", "--port", "8000"]