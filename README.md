STEP-1: LAUNCH T2.LARGE INSTANCE WITH ADMIN PERMISSIONS
STEP-2: Install AWS CLI, kubectl, and eksctl
Install AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
TO SET PATH: vim .bashrc
export PATH=$PATH:/usr/local/bin/
source .bashrc
Install KUBECTL:
curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.19.6/2021-01-05/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin
kubectl version --short --client
Install EKSCTL:
curl -sLO "https://github.com/eksctl-io/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz"
 tar -xzf eksctl_$(uname -s)_amd64.tar.gz -C /tmp
 sudo mv /tmp/eksctl /usr/local/bin
eksctl version
STEP-3: Create EKS Cluster
create cluster:
GitHub - usubbu/microservices-project
eksctl create cluster --name=EKS-1 --region=us-east-1 --zones=us-east-1a,us-east-1b --without-nodegroup
Attach IAM Role:
eksctl utils associate-iam-oidc-provider --region ap-south-1 --cluster EKS-1 --approve
create NodeGroup:
eksctl create nodegroup \
  --cluster EKS-1 \
  --region us-east-1 \
  --name node2 \
  --node-type t3.medium \
  --nodes 3 \
  --nodes-min 2 \
  --nodes-max 4 \
  --node-volume-size 20 \
  --ssh-access \
  --ssh-public-key thrinadh \
  --managed \
  --asg-access \
  --external-dns-access \
  --full-ecr-access \
  --appmesh-access \
  --alb-ingress-access
  Open INBOUND TRAFFIC IN ADDITIONAL Security Group
Create Servcie account/ROLE/BIND-ROLE/Token
Create Service Account, Role & Assign that role, And create a secret for Service Account and geenrate a Token
Creating Service Account
