# k8s manifest 를 github 과 agro 를 활용하여, 코드로 관리

## ArgoCD CLI로 로그인 수행

- ArgoCD 배포후 최초 admin 계정 비밀번호 확인
- 접속후 배포된 rollout Object 확인 방법
- 우측 상단에 있는 "NS:" 부분에 명시된 드롭다운 리스트 클릭
- 드롭다운 리스트 중 rollout object가 배포된 NS(Namespace) 선택
```
$ kubectl -n argocd get secret argocd-initial-admin-secret -o 
jsonpath="{.data.password}" | base64 -d; echo
```
## ArgoCD 접속을 위한 External-IP 확인
![2c13e7b9afa4871a](https://github.com/jominjun94/EKS-Project/assets/72008472/64e3700d-a3b6-4eb8-9b47-42791641f6a1)

argocd-server의 External-IP를 확인
```
$ kubectl get svc -n argocd
```
## ArgoCD 접속 후 manifest 깃허브 레파지토리 등록

https://github.com/jominjun94/service-repository 등록 후 수정 배포

![2](https://github.com/jominjun94/EKS-Project/assets/72008472/f4b1dfe5-eb92-484f-aee4-5885f18d787c)

