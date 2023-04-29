#### RUN TOMCAT TO DEPLOY WAR FILE

FROM tomcat:jre17

COPY apache-tomee-9.0.0-plus.tar.gz .
RUN tar -xvf apache-tomee-9.0.0-plus.tar.gz --strip-components=1 
RUN rm bin/*.bat 
RUN  rm apache-tomee-9.0.0-plus.tar.gz

ENV HOME=/app

EXPOSE 8080


ADD context.xml /usr/local/tomcat/webapps/manager/META-INF/ 

ADD context.xml /usr/local/tomcat/conf/

ADD tomcat-users.xml /usr/local/tomcat/conf/

ADD setenv.sh /usr/local/tomcat/bin/

ADD opentelemetry-javaagent.jar /usr/local/tomcat/lib/

ADD index.jsp /usr/local/tomcat/webapps/ROOT/

ADD nosi /usr/local/tomcat/webapps/app1/WEB-INF/classes/nosi
COPY IGRP /usr/local/tomcat/webapps/app1


##COPY IGRP.war /usr/local/tomcat/webapps/app1.war

##COPY /activiti/IGRP.war /usr/local/tomcat/webapps/

CMD ["catalina.sh", "run"]

