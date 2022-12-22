#!/bin/bash

CLUSTER_NAME=$1
SERVICE_NAME=$2
TASK_DEFINATION=$3

taskArn=$(grep -oP '(?<="taskDefinitionArn": ")[^"]*' $TASK_DEFINATION | head -1)
echo $taskArn

aws ecs update-service --cluster $CLUSTER_NAME --service $SERVICE_NAME --task-definition $taskArn --desired-count 1