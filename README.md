# 20260209 Docker 이해도 평가
> Docker 환경 위에서 Flask 애플리케이션을 구동하고, DB를 연동하기 위한 테스트 프로젝트

## 1. 
- **'/' 요청 응답** <br>
   <img width="532" height="229" alt="image" src="https://github.com/user-attachments/assets/0700ce4e-f7fc-4d00-9de5-a2aa0f2a8f19" /><br>
- **'/health' 요청 응답** <br>
  <img width="612" height="235" alt="image" src="https://github.com/user-attachments/assets/f0da065c-ae01-4469-b142-d916112f4841" /><br>

## 2. 다단계 빌드 Dockerfile 작성
> 빌드 및 실행
- 이미지 빌드:
  ```bash
  docker build -t flask-multi-stage .
  ```
- 이미지 확인:
  ```bash
  docker images | grep flask
  ```
  <img width="805" height="143" alt="image" src="https://github.com/user-attachments/assets/80d1d446-2ba1-46b7-8adb-27851a0224e2" /><br>

- 컨테이너 생성 및 실행:
  ```bash
  docker run -d -p 9000:9000 flask-multi-stage
  ```
  
## 3. 도커 허브 업로드
##### Docker Hub 이미지 주소 및 명령어
- **이미지 페이지 URL**: `https://hub.docker.com/r/agn705/flask-test-app`
- **다운로드 명령어** (Pull):
```Bash
docker pull agn705/flask-test-app:v1.0
```

## 4. 위 이미지와 DB 1개 묶어서 컨테이너로 만드는 docker-compose.yaml 작성

1. MySQL 접속 테스트 (DBeaver) <br>
<img width="307" height="119" alt="image" src="https://github.com/user-attachments/assets/2666913a-3c4b-4233-8f9a-ed61fe788f9a" /><br>

2. Flask 앱 접속 테스트 <br>
   <img width="498" height="207" alt="image" src="https://github.com/user-attachments/assets/44794ca0-b57c-4d55-8980-615cfc5fd1e0" /><br>
