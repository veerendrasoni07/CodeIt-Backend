FROM openjdk:17-slim

RUN useradd -m user_runner

USER user_runner

WORKDIR /app

COPY runner.sh .

ENTRYPOINT [ "sh","runner.sh" ]



