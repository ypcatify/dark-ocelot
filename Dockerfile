FROM ubuntu:14.04
RUN apt update && apt install -y \
    build-essential \
    xorg \
    libssl-dev \
    libxrender-dev \
    wget \
    git \
    fontconfig \
    xfonts-75dpi \
    ruby \
    ruby-dev \
    ruby-bundler \
    && wget http://download.gna.org/wkhtmltopdf/0.12/0.12.2.1/wkhtmltox-0.12.2.1_linux-trusty-amd64.deb \
    && dpkg -i wkhtmltox-0.12.2.1_linux-trusty-amd64.deb \
    && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN git clone https://github.com/ypcatify/dark-ocelot.git /root/dark-ocelot
WORKDIR /root/dark-ocelot
RUN bundle install
ENV RACK_ENV production
EXPOSE 9292
CMD ["puma"]

