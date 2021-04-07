build-docker-website:
	docker build --target workspace -t website -f docker/website/Dockerfile .

tag-docker-website:
	docker tag website:latest gcr.io/winzana-infra/workspace/website:v0.0.1
