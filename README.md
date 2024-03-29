# AWS K8S HELM EKSCTL K9S tools
Do you have many AWS environments and want to easly switch beetween configuration and between different computers? This project is for you! 
No need to install any of the K8S and AWS tools, just run `build.sh` script and then follow below instructions.


Simply create env file (you can use `example_env`) with following data :
```
AWS_ACCESS_KEY_ID=YOUR_AWS_ACCESS_KEY
AWS_SECRET_ACCESS_KEY=SUPER_SECRET_KEY
AWS_DEFAULT_REGION=us-east-2
K8S_CLUSTER_NAME=your_cluster_name
```
for every environment you have ! You could have as many env files as you want.

Then just create run script using example `example_run.sh`:
```
#!/bin/bash
docker run -it --rm --env-file ./example_env  --network host --name kubernetes-yourproject aws-helm-kubernetes-tools
```
substituting `--env-file` value with your env file and `--name` value with new container name.

## Using user without cluster privileges
If your user doesn't have kubernetes permission you can still use it with this project. Please use `example_run_without_kubernetes.sh` script to see how to create running scripts. 

## Docker usage
You can also want to use docker to push/pull from your AWS  ECR, then you just need to simply add:
```
-v /var/run/docker.sock:/var/run/docker.sock
```
to your run script. Please use appropriate path to docker socket in your host. 

## Available tools
K9S, kubectl, eksctl, aws, terraform, terragrunt, docker.

## License
Check [LICENSE.md](LICENSE.md) file.
