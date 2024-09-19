# home-lab
Repositories and scripts for my homelab


## Kubernetes dashboard
### Access url
export KUBECONFIG=secrets/k3s.config
kubectl -n kubernetes-dashboard port-forward svc/kubernetes-dashboard-kong-proxy 8443:443
https://localhost:8443/#/login

### Get Token
kubectl get secret admin-user -n kubernetes-dashboard -o jsonpath={".data.token"} | base64 -d