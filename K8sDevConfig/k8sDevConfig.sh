#1/bin/bash

alias k = "kubectl"

alias kp = "kubectl get pods"
alias kpw = "kubectl get pods -o wide"
alias kd = "kubectl get deployments"
alias ksts = "kubectl get statefulsets"
alias kn = "kubectl get nodes"
alias kpvc = "kubectl get pvc"
alias knp = "kubectl get netpol"
alias ksvc = "kubectl get svc"
alias kcm = "kubectl get configmaps"
alias krs = "kubectl get replicasets"
alias ksec = "kuebctl get secrets"

alias kdescd = "kubectl describe deployment"
alias kdescp = "kubectl describe pod"
alias kdescsvc = "kubectl describe service"

keditd(){
    kubectl edit deployment $1 -o yaml
}
kscaled(){
    kubectl scale deployment $1 -- replicas=$2
}
ksetns(){
    kubectl config set-context --current --namespace=$1
}
kloginp(){
    kubectl exec -it $1 -- /bin/bash
}
