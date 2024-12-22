FROM python:3.9-slim

WORKDIR /todo

COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

# Объявляем том для хранения данных
VOLUME ["/todo/data"]

ENV PYTHONUNBUFFERED=1

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8091"]
