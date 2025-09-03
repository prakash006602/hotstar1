
FROM tomcat:9.0

RUN rm -rf /usr/local/tomcat/webapps/ROOT

COPY target/myapp.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["/usr/local/tomcat/bin/catalina.sh", "run"]
