include .env
export $(shell sed 's/=.*//' .env)

default: start

build:
	$(MAKE) build-blog
	$(MAKE) build-meteo
	$(MAKE) build-front
push:
	$(MAKE) push-blog
	$(MAKE) push-meteo
	$(MAKE) push-front

build-and-push:
	$(MAKE) build
	$(MAKE) push

build-blog:
	docker build -t ${REGISTRY}${REPOSITORY}/blog:${TAG} -f docker/node/common/Dockerfile --target node_dist --build-arg BUILD_BIN="api-blog" .
push-blog:
	docker push ${REGISTRY}${REPOSITORY}/blog:${TAG}

build-meteo:
	docker build -t ${REGISTRY}${REPOSITORY}/meteo:${TAG} -f docker/node/common/Dockerfile --target node_dist --build-arg BUILD_BIN="api-meteo" .
push-meteo:
	docker push ${REGISTRY}${REPOSITORY}/meteo:${TAG}

build-front:
	docker build -t ${REGISTRY}${REPOSITORY}/front:${TAG} -f docker/web/common/Dockerfile --build-arg APP_ENV=production --target common .
push-front:
	docker push ${REGISTRY}${REPOSITORY}/front:${TAG}
