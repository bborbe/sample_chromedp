
IMAGE        ?= sample-chromedp
REGISTRY     ?= docker.io
VERSION      ?= latest

build:
	imagebuilder -t $(REGISTRY)/$(IMAGE):$(VERSION) -f Dockerfile:Dockerfile .

upload:
	docker push $(REGISTRY)/$(IMAGE):$(VERSION)

clean:
	docker rmi $(REGISTRY)/$(IMAGE):$(VERSION) || true

run:
	docker run -ti $(REGISTRY)/$(IMAGE):$(VERSION)  bash
