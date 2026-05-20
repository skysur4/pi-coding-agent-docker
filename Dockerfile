# 1. 베이스 이미지 설정
FROM ubuntu:latest

# 환경 변수 설정 (설치 중 상호작용 방지)
ENV DEBIAN_FRONTEND=noninteractive

# 2. 필수 도구 및 Node.js 설치
RUN apt-get update && apt-get install -y \
    curl \
    git \
    python3 \
    python3-pip \
    ca-certificates \
    nodejs \
    npm \
    && rm -rf /var/lib/apt/lists/*

# 작업 디렉토리 설정
WORKDIR /app

# 3. 공식 설치 스크립트 실행 (에이전트 설치)
RUN curl -fsSL https://pi.dev/install.sh | sh

# 4. Pi-Web 패키지 설치
RUN curl -fsSL https://raw.githubusercontent.com/jmfederico/pi-web/main/install.sh | sh

# 5. 서비스 실행을 위한 엔트리포인트 스크립트 생성
# 두 개의 프로세스를 동시에 실행하기 위해 쉘 스크립트를 작성합니다.
RUN echo '#!/bin/bash\n\
# 첫 번째 프로세스 실행 (백그라운드)\n\
pi-coding-agent &\n\
# 두 번째 프로세스 실행 (포그라운드 - 컨테이너 유지용)\n\
pi-web start' > /app/entrypoint.sh && chmod +x /app/entrypoint.sh

# 6. 최종 실행 명령
CMD ["/app/entrypoint.sh"]