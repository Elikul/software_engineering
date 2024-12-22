FROM python:3.9-slim

WORKDIR /short_url

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Объявляем том для хранения базы данных
VOLUME ["/short_url/data"]

ENV PYTHONUNBUFFERED=1

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8090"]

