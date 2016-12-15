FROM anapsix/alpine-java:8

MAINTAINER Abhinav Pobbati <abhi@oteemo.com>

ENV SONATYPE_HOME /opt/sonatype-nexus
ENV SONATYPE_WORK /opt/sonatype-work
ENV IQ_SERVER_VERSION 1.24.0-02

WORKDIR ${SONATYPE_HOME}

ADD https://download.sonatype.com/clm/server/nexus-iq-server-${IQ_SERVER_VERSION}-bundle.tar.gz .
RUN tar -xvf nexus-iq-server-${IQ_SERVER_VERSION}-bundle.tar.gz && \
    rm nexus-iq-server-${IQ_SERVER_VERSION}-bundle.tar.gz demo.sh demo.bat config.yml README.txt

VOLUME ${SONATYPE_WORK}

EXPOSE 8070
EXPOSE 8071

ENTRYPOINT ["java", "-XX:MaxPermSize=512m", "-Djava.security.egd=file:/dev/./urandom", "-jar", "nexus-iq-server-1.24.0-02.jar", "server", "/etc/nexus-iq/config.yml"]
