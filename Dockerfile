# Download base image alpine. 
FROM alpine:3.7

# Dockerfile author / maintainer
MAINTAINER Arun <arun.sadasivan@polycom.com>

RUN apk update && \
    apk add bash && \
    #apk add --no-cache python3 && \
	# for dig, host and nslookup
	apk add bind-tools && \ 
	apk add coreutils && \
	apk add git && \
	apk add openssh && \
	apk add python3 && \
    python3 -m ensurepip && \
    rm -r /usr/lib/python*/ensurepip && \
    pip3 install --upgrade pip setuptools && \
    if [ ! -e /usr/bin/pip ]; then ln -s pip3 /usr/bin/pip ; fi && \
    if [[ ! -e /usr/bin/python ]]; then ln -sf /usr/bin/python3 /usr/bin/python; fi && \
    rm -r /root/.cache

# Clean APK cache
RUN rm -rf /var/cache/apk/*
	
WORKDIR /home
RUN git clone --depth 1 https://github.com/drwetter/testssl.sh.git

COPY entrypoint.sh /home/
RUN ["chmod", "+x", "entrypoint.sh"]

# use the ENTRYPOINT to run the docker as executable
ENTRYPOINT ["/home/entrypoint.sh"]
CMD ["--help"]
