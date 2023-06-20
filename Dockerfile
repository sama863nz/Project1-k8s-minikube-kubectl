# Use the Nginx base image
FROM nginx

# Copy your custom index.html file to the document root directory
COPY index.html /usr/share/nginx/html/

# Expose port 80 for web traffic
EXPOSE 80
