DOCKER_IMAGE ?= leosuncin/cordova-cypress

build:
	@docker build \
	--build-arg VCS_REF=`git rev-parse --short HEAD` \
	--build-arg BUILD_DATE=`date -u +"%Y-%m-%dT%H:%M:%SZ"` \
	-t ${DOCKER_IMAGE} .

test:
	@echo "Test Android"
	@docker run --rm ${DOCKER_IMAGE} sh -c "sdkmanager --list"
	@echo "Test Cypress"
	@docker run --rm ${DOCKER_IMAGE} sh -c "yarn global add --silent cypress && yarn exec cypress verify"