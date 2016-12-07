FROM anapsix/alpine-java:8

MAINTAINER Abhinav Pobbati <abhi@oteemo.com>

WORKDIR /opt/nexus-iq
ADD https://download.sonatype.com/clm/server/nexus-iq-server-1.24.0-02-bundle.tar.gz .
RUN tar -xvf nexus-iq-server-1.24.0-02-bundle.tar.gz && \
    rm nexus-iq-server-1.24.0-02-bundle.tar.gz demo.sh demo.bat config.yml README.txt

EXPOSE 8070
EXPOSE 8071

ENTRYPOINT ["java", "-XX:MaxPermSize=512m", "-Djava.security.egd=file:/dev/./urandom", "-jar", "nexus-iq-server-1.24.0-02.jar", "server", "/etc/nexus-iq/config.yml"]
