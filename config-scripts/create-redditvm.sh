#!/bin/bash

gcloud compute instances create reddit-app \
--zone=europe-north1-a \
--machine-type=f1-micro \
--subnet=default \
--tags=puma-server \
--image-family=reddit-full \
--boot-disk-size=10GB \
--boot-disk-type=pd-standard \
--boot-disk-device-name=reddit-app
