FROM gcc:latest

RUN useradd -m user_runner
USER user_runner

WORKDIR /app

COPY runner.sh .

ENTRYPOINT [ "sh","runner.sh" ]