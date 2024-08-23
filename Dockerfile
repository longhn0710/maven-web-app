# Use the official Tomcat base image
FROM tomcat:8.0.20-jre8

# Remove the default web applications
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file to the webapps directory as ROOT.war
COPY target/*.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080
EXPOSE 8080

# Start Tomcat server
CMD ["catalina.sh", "run"]
