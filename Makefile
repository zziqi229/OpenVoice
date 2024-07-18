.PHONY: build

build-img: build
	@echo "Building img"
	docker build \
		--build-arg http_proxy=$(PROXY) --build-arg https_proxy=$(PROXY) \
	        --build-arg HTTP_PROXY=$(PROXY) --build-arg HTTPS_PROXY=$(PROXY) \
	        -t zziqi/openvoice:v1 .
