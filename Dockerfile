# ---------- Base Runtime ----------
FROM python:3.11-slim

WORKDIR /app

# 只复制 production 依赖
COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

# 再复制代码
COPY app/ app/

CMD ["python", "-c", "from app.main import handler; print(handler())"]