FROM beevelop/cordova
ARG BUILD_DATE
ARG VCS_REF

LABEL maintainer="Jaime Leonardo Suncin Cruz <leosuncin@gmail.com>"
LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.name="leosuncin/docker-cordova-cypress" \
      org.label-schema.description="Latest Android with Node.js `v8` (npm, yarn and cypress ready)" \
      org.label-schema.url="https://hub.docker.com/r/leosuncin/cordova-cypress" \
      org.label-schema.vcs-ref=$VCS_REF \
      org.label-schema.vcs-url="https://github.com/leosuncin/docker-cordova-cypress" \
      org.label-schema.vendor="Jaime Leonardo Suncin Cruz" \
      org.label-schema.schema-version="1.0"

ENV PATH $PATH:$ANDROID_HOME/tools/bin
RUN apt-get update -qq && \
	apt-get install -qq -y --no-install-recommends apt-transport-https && \
	curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
	echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
	apt-get update -qq && \
	apt-get install -qq -y --no-install-recommends yarn libxtst6 libgtk-3-0 libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 xvfb jq build-essential && \
    rm -rf /var/lib/apt/lists/* && \
    apt-get clean -y &&\
	useradd --create-home cypress

USER cypress

WORKDIR "/tmp/repo"
