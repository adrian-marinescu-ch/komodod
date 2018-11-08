NAME		?= capitaltech/call-docker
IMAGE		?= $(NAME):latest

.PHONY: default build run push deploy

default: build run

build:
	@echo '> Building "$(NAME)" docker image...'
	@docker build -t $(IMAGE) .

run:
	@echo '> Starting "$(NAME)" container...'
	@docker run -p 19608:19608 \
							-p 19609:19609 \
							-d $(IMAGE)

push:
	docker push $(IMAGE)
