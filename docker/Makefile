GIT_TAG=$(shell git rev-parse --short HEAD)

.PHONY: build
build:
	docker build --build-arg INCUBATOR_VER=$(GIT_TAG) -t benjaminfuchs/rpi-nerd-alarmclock .

.PHONY: push
push:
	docker push benjaminfuchs/rpi-nerd-alarmclock
