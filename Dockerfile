FROM node:6.9.4

# Install git tools
RUN apt-get update && \
    apt-get -y install git && \
    apt-get -y install ftp && \
    apt-get -y install git-ftp && \
    apt-get -y install lftp

# Install PHP7 and composer
RUN apt-get -qq update && \
    apt-get -y install ca-certificates apt-transport-https && \
    wget -q https://packages.sury.org/php/apt.gpg -O- | apt-key add - && \
    echo "deb https://packages.sury.org/php/ jessie main" | tee /etc/apt/sources.list.d/php.list && \
    apt-get -qq update && \
    apt-get -y install php7.2-cli php7.2-common php7.2-curl php7.2-gd php7.2-json php7.2-mbstring php7.2-mysql php7.2-xml zip unzip php7.2-zip && \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install Google Cloud SDK
    RUN export CLOUDSDK_CORE_DISABLE_PROMPTS=1 && \
    SDK_VERSION=212.0.0 && \
    SDK_FILENAME=google-cloud-sdk-${SDK_VERSION}-linux-x86_64.tar.gz && \
    curl -O -J https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/${SDK_FILENAME} && \
    tar -zxvf ${SDK_FILENAME} --directory ${HOME} && \
    export PATH=${PATH}:/root/google-cloud-sdk/bin
	
ENV CLOUDSDK_CORE_DISABLE_PROMPTS=1
ENV PATH="${PATH}:/root/google-cloud-sdk/bin"
