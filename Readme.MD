# Coding Test

## Deploy Terraform
```sh
terraform apply
```

## Create Docker image
```sh
docker build -t jorgeregula/products .
docker push jorgeregula/products
```

## Deploy chart
```sh
helm upgrade --install products ./helm -f helm/values.yaml
```

## test autoscaling HPA
```sh
kubectl -n products run -i --tty load-generator --rm --image=busybox --restart=Never -- /bin/sh -c "while sleep 0.01; do wget -q -O- http://products:8080; done"
```
you should start to see new pods come up once threshold is met

```sh
kubectl -n products get po -w
```
