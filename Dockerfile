FROM tomcat:latest
RUN cp -R /usr/local/tomcat/webapps.dist/*  /usr/local/tomcat/webapps
COPY index.html /usr/local/tomcat/webapps
