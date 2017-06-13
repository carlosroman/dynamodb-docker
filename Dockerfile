FROM openjdk:8-jre-alpine

RUN apk --no-cache --virtual .build-dependencies add wget ca-certificates \
    && update-ca-certificates --fresh \
    && mkdir -p /usr/local/lib/dynamodb \
    && wget -P /tmp https://s3.eu-central-1.amazonaws.com/dynamodb-local-frankfurt/dynamodb_local_latest.tar.gz \
    && tar -zxvf /tmp/dynamodb_local_latest.tar.gz -C /usr/local/lib/dynamodb \
    && apk del .build-dependencies

WORKDIR /usr/local/lib/dynamodb

EXPOSE 8000

ENTRYPOINT ["java", "-Djava.library.path=./DynamoDBLocal_lib", "-jar", "DynamoDBLocal.jar", "-sharedDb"]