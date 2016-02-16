DOCKER_USERNAME=dawi2332
DOCKER_NAME=elastic-ip-attach
DOCKER_TAG=$(DOCKER_USERNAME)/$(DOCKER_NAME)

.PHONY=all deps build push clean

all:

push: build
	docker push $(DOCKER_TAG)

run: build
	docker run -it --rm $(DOCKER_TAG)

build: deps
	docker build -t $(DOCKER_TAG) .

deps:

clean:
