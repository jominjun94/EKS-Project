[Prometheus]

 https://easthyeok.tistory.com/16
 1. 프로메테우스 배포
kubectl create namespace monitoring

monitoring 네임스페이스 생성
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts


prometheus-community 차트 리포지토리를 추가
helm upgrade -i prometheus prometheus-community/prometheus \
    --namespace monitoring \
    --set alertmanager.persistentVolume.storageClass="gp2",server.persistentVolume.storageClass="gp2"

AWS EBS를 PV로 사용하려면 접근권한을 설정해줘야한다
 eksctl create iamserviceaccount \
  --name ebs-csi-controller-sa \
  --namespace kube-system \
  --cluster my-cluster \
  --attach-policy-arn arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy \
  --approve \
  --role-only \
  --role-name AmazonEKS_EBS_CSI_DriverRole

IAM역할생성 
eksctl create addon --name aws-ebs-csi-driver --cluster my-cluster --service-account-role-arn arn:aws:iam::111122223333:role/AmazonEKS_EBS_CSI_DriverRole --force

alertmanger 수정
스테이트풀셋에 있는 alertmanger를 클러스터 내부에서 통신하기위해 컨피그 수정

ebs csi 확인 
eksctl get addon --name aws-ebs-csi-driver --cluster my-cluster

kubectl get pvc -n moritoring | grep prometheus

kubectl get pods -n prometheus



ingress 통신을 위한 설정
grafana service 변경 후 ingrss에 추가 작업

 - host: prometheus.dhkim94.com
    http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: prometheus-server
                port:
                  number: 80
  - host: grafana.dhkim94.com
    http:
        paths:
          - path: /
            pathType: Prefix
            backend:
              service:
                name: grafana
                port:
                  number: 80







