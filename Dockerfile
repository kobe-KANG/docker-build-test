# 1. build stage
# builder JDK 지정
FROM azul/zulu-openjdk:17-latest AS builder

# 워크 디렉토리 지정
WORKDIR /app

# 소스 코드, 설정 파일 복사
COPY . .

# 빌드 수행
RUN ./gradlew clean build


# 2. run stage
# base-image 지정
FROM azul/zulu-openjdk:17-latest

# 워크 디렉토리 지정
WORKDIR /app

# 빌드 스테이지에서 생성된 jar 파일을 실행 환경으로 복사
COPY --from=builder /app/build/libs/*.jar app.jar

# 컨테이너 사용 포트 지정 (8080)
EXPOSE 8080

# jar 파일 실행
ENTRYPOINT ["java", "-jar", "app.jar"]
