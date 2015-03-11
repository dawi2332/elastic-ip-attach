BOTO_VERSION=2.36.0
BOTO_DIR=boto
BOTO_TGZ=$(BOTO_VERSION).tar.gz
DOCKER_USERNAME=dawi2332
DOCKER_NAME=elastic-ip-attach
DOCKER_TAG=$(DOCKER_USERNAME)/$(DOCKER_NAME)

.PHONY=all deps build push clean clean

all:

push: build
	docker push $(DOCKER_TAG)

run: build
	docker run -it --rm $(DOCKER_TAG)

build: deps
	docker build -t $(DOCKER_TAG) .

deps: $(BOTO_DIR)

clean:
	-rm -f $(BOTO_TGZ)
	-rm -rf $(BOTO_DIR)

$(BOTO_TGZ):
	wget https://github.com/boto/boto/archive/$(BOTO_TGZ)

$(BOTO_DIR): $(BOTO_TGZ)
	tar -xzf $(BOTO_TGZ)
	mv boto-$(BOTO_VERSION) $(BOTO_DIR)
