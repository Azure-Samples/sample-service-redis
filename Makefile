IMAGE=mcr.microsoft.com/k8se/samples/sample-service-redis
IMAGE2=duglin/sample.service-redis

all: .image

.image: app.go go.* Dockerfile
	go build -o /dev/null app.go	# quick fail
	docker build -t $(IMAGE) .
	# docker push $(IMAGE)
	docker tag $(IMAGE) $(IMAGE2)
	docker push $(IMAGE2)
	touch .image
