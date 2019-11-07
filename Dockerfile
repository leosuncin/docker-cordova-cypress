FROM beevelop/cordova

LABEL maintainer="Jaime Leonardo Suncin Cruz <leosuncin@gmail.com>"

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
