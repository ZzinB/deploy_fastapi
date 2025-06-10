# 베이스 이미지
FROM python:3.11-slim

# 작업 디렉토리 생성
WORKDIR /app

# uv 관련 파일 복사
COPY uv.lock pyproject.toml /app/

# uv 설치
RUN pip install uv

# 의존성 동기화 (uv.lock 기준으로)
RUN uv sync

# FastAPI 앱 소스 복사
COPY . /app

# uvicorn으로 앱 실행 (포트 8000)
CMD ["uv", "run", "uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
