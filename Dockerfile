# Use the official Ubuntu base image
FROM ubuntu:rolling

#update the Ubuntu environment and install the Apache2 server package from the Ubuntu repository
RUN apt update -y && apt install apache2 -y

#Create a Working directory
WORKDIR /var/www/html

# Copy the index.html file from the Docker build context to the default Apache document root directory in the container
COPY index.html .

# Specify the command to run when the container starts, which starts the Apache2 server in the foreground
CMD ["/usr/sbin/apache2ctl","-D","FOREGROUND"]

# Expose port 80 to allow incoming HTTP traffic to the container
EXPOSE 80