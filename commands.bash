#!/bin/bash

echo "check the file by 'cat commands.bash'!"
sleep 2
echo "build the container!, we need the name and version, this time is the default is: latest"
echo "docker build -t hello-world-image ."
docker build -t hello-world-image .

echo "Run the container in 2 sec"
sleep 2
echo "running the container with rm will remove the files 'cached' after the container exits"
echo "docker run --rm -e WEBPIC=\"http://szerver1.local/teszt.jpg\" hello-world-image"

docker run --rm -e WEBPIC="https://upload.wikimedia.org/wikipedia/commons/thumb/c/cd/Google_Logo_%281998%29.png/155px-Google_Logo_%281998%29.png" hello-world-image

echo "tag the image to be able to publish to others"
echo "docker tag hello-world-image localhost:5000/hello-world-image:latest" 
docker tag hello-world-image localhost:5000/hello-world-image:latest

echo "to bublish something to private registry, you need to request access from local admin"
echo "you may able to publish to somewhere, but this tutorial ends there"
echo "if you need to publish to a local ergistry, then ask chatgpt, it is pretty simple, like"
echo "starting a registry locally and publish the tagged image with command:"
echo "docker push localhost:5000/hello-world-image:latest"
echo "then you can run with "
echo "docker run -d -p 5000:5000 --name registry registry:2"
echo "then, in an other terminal, check with :"
echo "curl -X GET http://localhost:5000/v2/_catalog"
echo "you should see something ...hello-world-image..."
