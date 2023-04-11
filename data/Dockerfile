#### RUN TOMCAT TO DEPLOY WAR FILE

FROM tomcat:jre17

COPY data/apache-tomee-9.0.0-plus.tar.gz .
RUN tar -xvf apache-tomee-9.0.0-plus.tar.gz --strip-components=1 
RUN rm bin/*.bat 
RUN  rm apache-tomee-9.0.0-plus.tar.gz

ENV HOME=/app

EXPOSE 8080


ADD data/context.xml /usr/local/tomcat/webapps/manager/META-INF/ 

ADD data/context.xml /usr/local/tomcat/conf/

ADD data/tomcat-users.xml /usr/local/tomcat/conf/

ADD data/index.jsp /usr/local/tomcat/webapps/ROOT/

ADD data/server.xml /usr/local/tomcat/conf/

COPY /IGRP/target/IGRP.war /usr/local/tomcat/webapps/app1.war

##COPY /activiti/*.war /usr/local/tomcat/webapps/

CMD ["catalina.sh", "run"]
