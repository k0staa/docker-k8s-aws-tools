#!/bin/bash
docker run -it --rm --env-file ./example_env  --network host --name kubernetes-yourproject aws-helm-kubernetes-tools 
