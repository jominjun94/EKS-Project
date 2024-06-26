# Prometheus

### 메트릭서버 설치는 hpa 사용 시 설치 완료

## 프로메테우스 배포
```
kubectl create namespace monitoring
```
## monitoring 네임스페이스 생성
```
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
```

## prometheus-community 차트 리포지토리를 추가
```
helm upgrade -i prometheus prometheus-community/prometheus \
    --namespace monitoring \
    --set alertmanager.persistentVolume.storageClass="gp2",server.persistentVolume.storageClass="gp2"
```
![스크린샷 2023-10-15 001844](https://github.com/jominjun94/EKS-Project/assets/72008472/b127ef83-199f-4c6f-bcc1-5b8f6738ed65)
![스크린샷 2023-10-15 001950](https://github.com/jominjun94/EKS-Project/assets/72008472/51e87bb9-0ffb-4e23-9504-686273731a63)

## AWS EBS 접근권한
```
eksctl create iamserviceaccount \
  --name ebs-csi-controller-sa \
  --namespace kube-system \
  --cluster my-cluster \
  --attach-policy-arn arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy \
  --approve \
  --role-only \
  --role-name AmazonEKS_EBS_CSI_DriverRole
  ```
  ## IAM역할생성 
  ```
  eksctl create addon --name aws-ebs-csi-driver --cluster my-cluster --service-account-role-arn arn:aws:iam::111122223333:role/AmazonEKS_EBS_CSI_DriverRole --force
  ```

# Grafana
![0716f0555b8ee15c](https://github.com/jominjun94/EKS-Project/assets/72008472/4de11f8c-a987-45af-8ae2-ed56ee98815b)
## 그라파나 배포
### ingress를 사용하여 프로메테우스와 그라파나를 접근
 
 ```
spec:
  rules:
    http:
        paths:
          - path: /prometheus
            pathType: Prefix
            backend:
              service:
                name: prometheus-server
                port:
                  number: 80
    http:
        paths:
          - path: /grafana
            pathType: Prefix
            backend:
              service:
                name: grafana
                port:
                  number: 80

```
