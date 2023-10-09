# AWS argo 설치 

## namespace 생성


```
$ kubectl create namespace argocd
$ kubectl apply -f install.yaml -n argocd
```

## ArgoCD CLI 설치


```
$ curl -sSL -o argocd-linux-amd64 https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64 
$ sudo install -m 555 argocd-linux-amd64 /usr/local/bin/argocd
$ rm argocd-linux-amd64
```
## ArgoCD CLI로 로그인 수행

- ArgoCD 배포후 최초 admin 계정 비밀번호 확인
```
$ kubectl -n argocd get secret argocd-initial-admin-secret -o 
jsonpath="{.data.password}" | base64 -d; echo
```
## ArgoCD 접속을 위한 External-IP 확인

argocd-server의 External-IP를 확인
```
$ kubectl get svc -n argocd
```
## ArgoCD 접속 후 manifest 깃허브 레파지토리 등록

https://github.com/jominjun94/service-repository 등록 후 수정 배포
