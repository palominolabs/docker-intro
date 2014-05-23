FROM ubuntu

RUN apt-get update -q
RUN apt-get install -qy curl

RUN curl -sSL https://get.rvm.io | bash -s stable
RUN /bin/bash -l -c 'rvm requirements'
RUN /bin/bash -l -c 'rvm install 2.1.1'
RUN /bin/bash -l -c 'rvm use 2.1.1'
RUN /bin/bash -l -c 'gem install bundler --no-ri --no-rdoc'

ADD . docker-demo
WORKDIR docker-demo

RUN /bin/bash -l -c 'bundle install'

EXPOSE 80
CMD /bin/bash -l -c 'rails server -p 80'
