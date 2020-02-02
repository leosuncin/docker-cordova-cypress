DOCKER_IMAGE ?= leosuncin/cordova-cypress

build:
	@IMAGE_NAME=${DOCKER_IMAGE} bash hooks/build

test:
	@IMAGE_NAME=${DOCKER_IMAGE} bash hooks/test