FROM openjdk:11-jre

ENV PATH /usr/local/tomee/bin:$PATH
RUN mkdir -p /usr/local/tomee

WORKDIR /usr/local/tomee

ENV TOMEE_VER 8.0.10
ENV TOMEE_BUILD plus

RUN curl -SL https://dist.apache.org/repos/dist/release/tomee/tomee-${TOMEE_VER}/apache-tomee-${TOMEE_VER}-${TOMEE_BUILD}.tar.gz -o tomee.tar.gz \
        && tar -xvf tomee.tar.gz --strip-components=1 \
        && rm bin/*.bat \
        && rm tomee.tar.gz*

COPY maven/*.war /usr/local/tomee/webapps/

EXPOSE 8080
CMD ["catalina.sh", "run"]
