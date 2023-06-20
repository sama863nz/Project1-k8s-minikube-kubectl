# Use an existing base image
FROM nginx:latest

# Copy the HTML, JS, CSS, and image files to the container
COPY index.html /usr/share/nginx/html/
COPY script.js /usr/share/nginx/html/
COPY styles.css /usr/share/nginx/html/
COPY sam.jpg /usr/share/nginx/html/

# Expose port 80 for the container
EXPOSE 80

# Start the nginx server
CMD ["nginx", "-g", "daemon off;"]
