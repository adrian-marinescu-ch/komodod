NAME		?= marinescuadrian/komodod
IMAGE		?= $(NAME):latest

.PHONY: default build push

default: build push

build:
	@echo '> Building "$(NAME)" docker image...'
	@docker build -t $(IMAGE) .

push:
	docker push $(IMAGE)
