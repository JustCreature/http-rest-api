FROM golang:latest

WORKDIR /code
COPY . .

RUN go mod download

# ARG UID=1000
# ARG GID=0
# ARG USER_NAME=runner
# ARG GROUP_NAME=root

# ENV USER_NAME=${USER_NAME}
# ENV GROUP_NAME=${GROUP_NAME}

# RUN useradd -m -u ${UID} -g ${GROUP_NAME} ${USER_NAME}

# RUN chown -R ${USER_NAME}:root /code \
#     && chmod -R g=u /code

USER root


RUN apt-get update && \
    apt-get install -y curl && \
    curl -s https://packagecloud.io/install/repositories/golang-migrate/migrate/script.deb.sh | bash && \
    apt-get install -y migrate

RUN go get github.com/githubnemo/CompileDaemon

EXPOSE 8090

CMD [ "start" ]

ENTRYPOINT [ "sh", "/code/docker-entrypoint.sh" ]
