#!/bin/sh

echo "Starting DynamoDB. Current JAVA_OPTS are '$JAVA_OPTS'"
java $JAVA_OPTS -Djava.library.path=./DynamoDBLocal_lib -jar DynamoDBLocal.jar -sharedDb -inMemory
