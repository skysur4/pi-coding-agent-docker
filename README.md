### docker-compose.yml
```
version: '3.8'

services:
  # 1. CLI 기반 에이전트 서비스
  coding-agent:
    build:
      context: .
      dockerfile: Dockerfile.agent
    container_name: pi-coding-agent
    restart: always
    networks:
      - pi-network
    # 에이전트가 데이터를 저장해야 한다면 볼륨 설정 추가 가능
    volumes:
      - agent_data:/app/agent

  # 2. 브라우저 접속용 웹 서비스
  pi-web:
    build:
      context: .
      dockerfile: Dockerfile.web
    container_name: pi-web-interface
    restart: always
    ports:
      - "3000:3000"  # 사용자가 브라우저에서 접속할 포트
    depends_on:
      - coding-agent # 에이전트가 먼저 실행되어야 웹에서 제어가 가능함
    networks:
      - pi-network
    volumes:
      - web_data:/app/web

networks:
  pi-network:
    driver: bridge

volumes:
  agent_data:
  web_data:
```