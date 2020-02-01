DOCKER_IMAGE ?= leosuncin/cordova-cypress

build:
	@docker build -t ${DOCKER_IMAGE} .

test:
	@echo "Test Android"
	@docker run --rm ${DOCKER_IMAGE} sh -c "sdkmanager --list"
	@echo "Test Cypress"
	@docker run --rm ${DOCKER_IMAGE} sh -c "yarn global add --silent cypress && yarn exec cypress verify"