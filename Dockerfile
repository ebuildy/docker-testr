FROM ebuildy/docker-nginx-php

MAINTAINER Thomas Decaux <ebuildy@gmail.com>

RUN apt-get update && apt-get upgrade -y
RUN apt-get install build-essential chrpath wget libssl-dev libxft-dev unzip python git -y

RUN apt-get install libfreetype6 libfreetype6-dev -y
RUN apt-get install libfontconfig1 libfontconfig1-dev -y


# Install phantomjs

RUN wget https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-1.9.7-linux-x86_64.tar.bz2 -P /home

RUN tar xvjf /home/phantomjs-1.9.7-linux-x86_64.tar.bz2
RUN mv phantomjs-1.9.7-linux-x86_64 /usr/local/share/
         
RUN ln -sf /usr/local/share/phantomjs-1.9.7-linux-x86_64/bin/phantomjs /usr/local/share/phantomjs
RUN ln -sf /usr/local/share/phantomjs-1.9.7-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs
RUN ln -sf /usr/local/share/phantomjs-1.9.7-linux-x86_64/bin/phantomjs /usr/bin/phantomjs

# Install casperjs

WORKDIR /home
RUN git clone https://github.com/n1k0/casperjs.git

RUN mv /home/casperjs /usr/local/share/casperjs-latest
         
RUN ln -sf /usr/local/share/casperjs-latest/bin/casperjs /usr/local/share/casperjs
RUN ln -sf /usr/local/share/casperjs-latest/bin/casperjs /usr/local/bin/casperjs
RUN ln -sf /usr/local/share/casperjs-latest/bin/casperjs /usr/bin/casperjs

COPY ./run.sh /var/run.sh
COPY ./config/supervisord.conf /etc/supervisor/supervisord.conf

CMD ["/var/run.sh"]
