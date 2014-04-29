FROM ubuntu

RUN apt-get update -q
RUN apt-get install -qy curl

RUN curl -sSL https://get.rvm.io | bash -s stable
RUN /usr/local/rvm/bin/rvm-shell -c -l 'rvm requirements'
RUN /usr/local/rvm/bin/rvm-shell -c -l 'rvm install 2.1.1'
RUN /usr/local/rvm/bin/rvm-shell -c -l 'rvm use 2.1.1'
RUN /usr/local/rvm/bin/rvm-shell -c -l 'gem install bundler --no-ri --no-rdoc'

ADD . docker-demo
WORKDIR docker-demo

RUN /usr/local/rvm/bin/rvm-shell -c -l 'bundle install'

EXPOSE 80
CMD /usr/local/rvm/bin/rvm-shell -c -l 'rails server -p 80'
