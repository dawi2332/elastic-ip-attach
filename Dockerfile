FROM alpine
MAINTAINER dawi2332@gmail.com
RUN apk add --update py-boto py-pip \
	&& pip install requests \
	&& apk del py-pip \
	&& rm -rf /var/cache/apk/* /tmp/* /var/tmp/*

ADD elastic-ip-attach /bin/elastic-ip-attach

CMD /bin/elastic-ip-attach
