#! /bin/bash

kubectl create deployment serverjs --image=cleal200/serverjs:latest

kubectl expose deployment/serverjs --type="NodePort" --port=8080 --name serverjs
