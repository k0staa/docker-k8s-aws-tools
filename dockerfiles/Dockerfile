FROM gradle:6.1.1-jdk11

ENV EDITOR vim 
ENV K9S_EDITOR vim

RUN cd /tmp \
    && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install

RUN cd /tmp \
    && curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl \
    && chmod +x ./kubectl \
    && mv ./kubectl /usr/local/bin/kubectl

RUN cd /tmp \
    && curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 \
    && chmod 700 get_helm.sh \
    && ./get_helm.sh

RUN cd /tmp \
    && curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C ./ \
    && mv ./eksctl /usr/local/bin

RUN cd /tmp \
    && curl --silent --location "https://github.com/derailed/k9s/releases/download/v0.25.18/k9s_Linux_x86_64.tar.gz" | tar xz -C ./ \
    && mv ./k9s /usr/local/bin

RUN cd /tmp \
    && curl "https://releases.hashicorp.com/terraform/1.1.9/terraform_1.1.9_linux_amd64.zip" -o terraform.zip \ 
    && unzip terraform.zip \
    && mv ./terraform /usr/local/bin

ADD https://github.com/gruntwork-io/terragrunt/releases/download/v0.37.0/terragrunt_linux_amd64 /usr/local/bin/terragrunt
RUN chmod +x /usr/local/bin/terragrunt


RUN apt-get update -y && apt install -y vim less jq docker.io

ENTRYPOINT ["sh","-c"," aws eks --region $AWS_DEFAULT_REGION update-kubeconfig --name $K8S_CLUSTER_NAME && bash"]




