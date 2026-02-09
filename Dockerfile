# --- 1단계: 빌드 스테이지 (Builder) ---
FROM python:3.12-slim AS builder

# 작업 디렉토리 설정
WORKDIR /app

# 환경변수 설정 (파이썬이 .pyc 파일을 생성하지 않도록 설정)
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# 가상환경 생성 및 경로 설정
RUN python -m venv /opt/venv
ENV PATH="/opt/venv/bin:$PATH"

# 종속성 설치 (캐시 활용을 위해 requirements.txt만 먼저 복사)
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# --- 2단계: 실행 스테이지 (Runner) ---
FROM python:3.12-slim

WORKDIR /app

# 빌드 스테이지에서 생성된 가상환경(/opt/venv)만 복사
COPY --from=builder /opt/venv /opt/venv

# 가상환경의 바이너리를 사용하도록 환경변수 설정
ENV PATH="/opt/venv/bin:$PATH"
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# 소스 코드 복사
COPY app.py .

# 보안을 위해 root가 아닌 일반 사용자 생성 및 전환
RUN adduser --disabled-password --gecos "" appuser
USER appuser

# 포트 노출 (Flask 앱 포트)
EXPOSE 9000

# 앱 실행 (Flask 실행)
CMD ["python", "app.py"]
