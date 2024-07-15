.PHONY: build
build-img: build
	@echo "Building img"
	docker build -t openvoice:v1 .