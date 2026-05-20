# 1. 범용성이 높고 다양한 도구 설치가 용이한 Ubuntu 최신 버전 기반
FROM ubuntu:latest

# 환경 변수 설정 (설치 중 상호작용 방지)
ENV DEBIAN_FRONTEND=noninteractive

# 2. 필수 도구 및 Node.js 설치
# curl, git, python3 등 스크립트 실행과 향후 기능(스킬) 사용에 필요한 도구들을 포함합니다.
RUN apt-get update && apt-get install -y \
    curl \
    git \
    python3 \
    python3-pip \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# 작업 디렉토리 설정
WORKDIR /app

# 3. 공식 설치 스크립트 실행
# 제공해주신 curl 명령어를 사용하여 에이전트를 설치합니다.
RUN curl -fsSL https://pi.dev/install.sh | sh

# 컨테이너 실행 시 기본 명령 (설치된 에이전트 명령어에 따라 조정될 수 있습니다)
# 보통 설치 스크립트는 특정 명령어를 시스템 경로에 등록합니다.
CMD ["pi-coding-agent"]