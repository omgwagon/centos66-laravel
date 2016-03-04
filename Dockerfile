FROM omgwagon/centos66-php7-fpm

COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

COPY src /var/www/html

RUN curl -s -l https://rpm.nodesource.com/setup_4.x | bash -

RUN curl -s -l http://people.centos.org/tru/devtools-2/devtools-2.repo -o /etc/yum.repos.d/devtools-2.repo

RUN yum -y install devtoolset-2-gcc devtoolset-2-binutils devtoolset-2-gcc-c++gcc
RUN . /opt/rh/devtoolset-2/enable && bash -

RUN yum -y install nodejs \
           openssl-devel \
           make \
           libnotify

RUN npm update -g npm

RUN npm install -g gulp node-gyp

RUN usermod -u 1000 nginx

WORKDIR /var/www/html
