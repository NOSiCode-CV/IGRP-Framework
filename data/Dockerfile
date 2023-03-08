#### RUN TOMCAT TO DEPLOY WAR FILE

FROM tomcat:8-jre8

COPY tomee.tar.gz .
RUN tar -xvf tomee.tar.gz --strip-components=1 
RUN rm bin/*.bat 
RUN  rm tomee.tar.gz

ENV HOME=/app

EXPOSE 8080


ADD context.xml /usr/local/tomcat/webapps/manager/META-INF/ 

ADD context.xml /usr/local/tomcat/conf/

ADD tomcat-users.xml /usr/local/tomcat/conf/

ADD index.jsp /usr/local/tomcat/webapps/ROOT/

COPY /IGRP/target/*.war /usr/local/tomcat/webapps/

COPY /activiti/*.war /usr/local/tomcat/webapps/

CMD ["catalina.sh", "run"]
