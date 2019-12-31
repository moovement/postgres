#!/usr/bin/env bash
set -e

PROJECT_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
pushd "${PROJECT_ROOT}"
: "${DOCKER_IMAGE:='moovement/postgres:11'}"
: "${DOCKER_REGISTRY:='docker.moovement.co'}"
: "${REPO:="${DOCKER_REGISTRY}/${DOCKER_IMAGE}"}"

docker build -t ${DOCKER_IMAGE} .
#docker build -t moovement/postgres:11 .
docker tag ${DOCKER_IMAGE} ${REPO}
#docker tag moovement/postgres:11 docker.moovement.co/moovement/postgres:11
#eval "$(aws ecr get-login --no-include-email --region "${AWS_REGION}")"
docker push "${REPO}"
#docker push docker.moovement.co/moovement/postgres:11
#ecs deploy ${ECS_CLUSTER_NAME} ${ECS_SERVICE_NAME} --image ${ECS_CONTAINER_NAME} ${REPO} --timeout 6000
popd
