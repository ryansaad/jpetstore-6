# Use a real Tomcat server image (Stable and keeps running)
FROM tomcat:9.0-jdk17

# Remove the default Tomcat homepage so our app can be the root
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy the WAR file that Jenkins built into the webapps folder
# We rename it to ROOT.war so it loads at http://IP:PORT/ instead of /jpetstore
COPY target/jpetstore.war /usr/local/tomcat/webapps/ROOT.war

# Open the port
EXPOSE 8080

# Start Tomcat
CMD ["catalina.sh", "run"]
