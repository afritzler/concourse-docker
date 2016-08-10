FROM alpine:latest

ENV PATH $PATH:/usr/local/bin
ENV TERRAFORM_VER 0.6.16
ENV TERRAFORM_ZIP terraform_${TERRAFORM_VER}_linux_386.zip

RUN apk add --update openssl openssh-client ca-certificates && rm -rf /var/cache/apk/*
RUN set -ex \
       && wget https://releases.hashicorp.com/terraform/${TERRAFORM_VER}/${TERRAFORM_ZIP} -O /tmp/${TERRAFORM_ZIP} \
       && unzip /tmp/${TERRAFORM_ZIP} -d /usr/local/bin  \
       && rm /tmp/${TERRAFORM_ZIP}

RUN apk add --update expect bash git && rm -rf /var/cache/apk/*
