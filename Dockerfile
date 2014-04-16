FROM ubuntu
MAINTAINER Jason Kraus "jason@montagable.com"
RUN apt-get -qq update
RUN apt-get install -y python-dev python-setuptools libxml2-dev libxslt-dev libmysqlclient-dev postgresql-client libpq-dev git-core wget make g++ libjpeg-dev libfreetype6 libfreetype6-dev zlib1g-dev curl libevent-dev libmemcached-dev libyaml-dev python-mysqldb ruby rubygems openjdk-7-jre-headless ruby-dev
RUN wget http://nodejs.org/dist/v0.10.26/node-v0.10.26.tar.gz -O /tmp/node.tar.gz
RUN (cd /tmp && tar zxf node.tar.gz && cd node-* && ./configure ; make install)
RUN wget https://npmjs.org/install.sh -O /tmp/install.sh
RUN clean=y sh /tmp/install.sh
RUN wget https://raw.github.com/technomancy/leiningen/stable/bin/lein -O /usr/bin/lein
RUN chmod a+x /usr/bin/lein
ENV LEIN_ROOT 1
RUN lein
RUN easy_install pip
RUN pip install newrelic
RUN gem install bundler foreman
RUN npm install -g bower

