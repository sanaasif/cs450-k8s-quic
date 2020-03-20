#!/bin/sh

kubectl delete pod nginx-http3

rm localhost.key localhost.pem
cp new_gen_cert/out/leaf_cert.key localhost.key
cp new_gen_cert/out/leaf_cert.pem localhost.pem

kubectl delete secret nginx-cert-key
kubectl delete secret nginx-cert-pem

kubectl create secret generic nginx-cert-key --from-file=localhost.key
kubectl create secret generic nginx-cert-pem --from-file=localhost.pem

#kubectl delete configmap h3nginxconfigmap
#kubectl delete configmap nginxconfigmap

#kubectl create configmap h3nginxconfigmap --from-file=h3.nginx.conf
#kubectl create configmap nginxconfigmap --from-file=nginx.conf


kubectl apply -f ./pod-nginx.yaml
