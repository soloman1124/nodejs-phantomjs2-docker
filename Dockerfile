FROM marcbachmann/phantomjs2:latest
MAINTAINER Soloman Weng "soloman1124@gmail.com"
ENV REFRESHED_AT 2015-07-17

RUN \
  apt-get update && \
  apt-get install -y python python-dev python-pip python-virtualenv wget tar

RUN \
  cd /tmp && \
  wget http://nodejs.org/dist/node-latest.tar.gz && \
  tar xvzf node-latest.tar.gz && \
  rm -f node-latest.tar.gz && \
  cd node-v* && \
  ./configure && \
  CXX="g++ -Wno-unused-local-typedefs" make && \
  CXX="g++ -Wno-unused-local-typedefs" make install && \
  cd /tmp && \
  rm -rf /tmp/node-v* && \
  npm install -g npm && \
  printf '\n# Node.js\nexport PATH="node_modules/.bin:$PATH"' >> /root/.bashrc

RUN rm -rf /var/lib/apt/lists/*
