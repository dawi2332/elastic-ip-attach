FROM ubuntu
MAINTAINER dawi2332@gmail.com

RUN apt-get -qq update && apt-get install -y python-requests python-setuptools
COPY boto /tmp/boto
RUN cd /tmp/boto && python setup.py install \
	&& apt-get autoremove -y python-setuptools && rm -rf /tmp/boto

ADD elastic-ip-attach /bin/elastic-ip-attach

CMD /bin/elastic-ip-attach
