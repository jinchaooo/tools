# Use an official parent image
FROM tensorflow/tensorflow:latest-gpu-py3-jupyter

# Install additional packages (as root user)
RUN apt-get update && apt-get install -y \
    sudo \
    vim \
    git
# 
# Add a group and a user that have same group id and
# user id as the host. This is because the host group
# name and host user name are invisible inside the 
# container, as they belong to different namespace.
# However, if set the group id and user id to be the 
# same for the host user and the created container user,
# they become the same user inside and outside container.
# Further, we add the created container user in sudoers 
# list, so it can have root privilege inside the container.
#

# ARG can also be passed as docker build arguments 
# through --build-arg flag
ARG GROUP_ID=1012
ARG USER_ID=1012

RUN groupadd -g ${GROUP_ID} docker &&\
    useradd -l -u ${USER_ID} -g docker docker &&\
    echo "docker:docker" | chpasswd &&\
    adduser docker sudo &&\
    install -d -m 0755 -o docker -g docker /home/docker

USER docker

#CMD /bin/bash

# Install any needed packages specified in requirements.txt
#RUN pip install --trusted-host pypi.python.org scikit-image==0.14.2 \
#    opencv-contrib-python==4.0.0.21 \
#    pandas==0.24.1 \
#    tqdm==4.31.1 \
#    Keras==2.2.4 \
#    natsort==6.0.0 \
#    imgaug==0.2.8

# Set the working directory to /app
##WORKDIR /app/code
#WORKDIR /app

# Copy the current directory contents into the container at /app
#COPY . /app

# Make port 80 available to the world outside this container
#EXPOSE 80

# Define environment variable
#ENV NAME World

# Run app.py when the container launches
##CMD ["python", "/app/code/UNET_AMS1.py"]
#CMD ["python", "/app/run_all.py"]
