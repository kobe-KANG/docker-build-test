# Docker image build test
Dockerfile을 사용해서 docker image를 build하고 container를 실행하는 것까지 테스트 해보자.


## 1) Dockerfile 작성
프로젝트 root 경로에 `Dockerfile`을 새로 작성한다.

### 구성
여기서는 `build stage`와 `run stage`를 나눠서 작성하였다.

1. build stage
    1. builder JDK 지정
    2. 워크 디렉토리 지정
    3. 소스 코드, 설정 파일 복사
    4. 빌드 수행
2. run stage
    1. base-image 지정
    2. 워크 디렉토리 지정
    3. jar 파일 복사
    4. 컨테이너 사용 포트 지정
    5. jar 파일 실행


## 2) Docker image 생성
작성된 Dockerfile을 기반으로 Docker image를 생성합니다.

```shell
# format
# docker build -t <컨테이너 이미지 이름> .

# example
$ docker build -t docker-build-test .
```

## 3) Docker container 실행
생성된 Docker image를 기반으로 container를 실행합니다.

```shell
# format
# docker run -d --name <컨테이너 이름> -p <host포트>:<container포트> <실행할 이미지 이름>

# example
$ docker run -d --name docker-build-test -p 8080:8080 docker-build-test
```