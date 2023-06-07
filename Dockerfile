FROM node:18.16.0

#apt-get update
RUN apt-get -qq update && \
    apt-get -y install lsb-release ca-certificates apt-transport-https


# Install git tools
RUN apt-get -y install git


# Install PHP8.2 and composer
RUN wget -O /etc/apt/trusted.gpg.d/php.gpg https://packages.sury.org/php/apt.gpg && \
    echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | tee /etc/apt/sources.list.d/php.list && \
    apt-get -qq update && \
    apt-get -y install php8.2 php8.2-curl php8.2-gd php8.2-mbstring php8.2-mysql php8.2-xml zip unzip php8.2-zip && \
	curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer


# Install Google Cloud SDK
RUN export CLOUDSDK_CORE_DISABLE_PROMPTS=1 && \
    SDK_VERSION=434.0.0 && \
    SDK_FILENAME=google-cloud-sdk-${SDK_VERSION}-linux-x86_64.tar.gz && \
    curl -O -J https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/${SDK_FILENAME} && \
    tar -zxvf ${SDK_FILENAME} --directory ${HOME} && \
    export PATH=${PATH}:/root/google-cloud-sdk/bin


ENV CLOUDSDK_CORE_DISABLE_PROMPTS=1
ENV PATH="${PATH}:/root/google-cloud-sdk/bin"
