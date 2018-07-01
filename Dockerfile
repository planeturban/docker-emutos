FROM ubuntu

RUN apt-get update && \
	apt-get update && \
	apt-get install -y make git gcc zip software-properties-common tofrodos && \
	apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 4AAD3A5DB5690522 && \
	LC_ALL=C.UTF-8 add-apt-repository -y ppa:vriviere/ppa && \
	apt-get update && \
	apt-get install -y cross-mint-essential

ENV COMMIT ""
ENV TARGET=release

CMD cd /usr/bin && ln -s fromdos dos2unix && ln -s todos unix2dos && cd && git clone https://github.com/emutos/emutos.git && cd emutos && git checkout $COMMIT && make $TARGET && mv release-archives /output

VOLUME /output
