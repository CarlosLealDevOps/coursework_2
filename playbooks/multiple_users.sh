#! /bin/bash

for i in {1..10}
do 
        curl $(minikube ip):31410
done

