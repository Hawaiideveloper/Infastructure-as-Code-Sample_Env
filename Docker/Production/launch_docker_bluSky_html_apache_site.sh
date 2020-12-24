#!/bin/bash


echo "please make sure to have your html directory setup properly"

echo "once the html directory is in the pwd, it will run"


sudo docker build -t blusky7 .
sudo docker run -dit --name my-running-app -p 80:80 blusky7