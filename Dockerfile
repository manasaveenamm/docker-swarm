FROM tomee:latest
# If you are building a Java Web App (.war file), copy it directly to the deployment directory
# COPY target/myapp.war /usr/local/tomee/webapps/ROOT.war

# For testing right now, let's just inject a simple index.html page into the root app folder
RUN mkdir -p /usr/local/tomee/webapps/ROOT
echo "<h1>Hello from Automated Jenkins & Docker Swarm TomEE Cluster!</h1>" > /usr/local/tomee/webapps/ROOT/index.html
