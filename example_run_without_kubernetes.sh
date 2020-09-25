#!/bin/bash
docker run -it --rm --entrypoint bash --env-file ./example_env  --network host --name kubernetes-yourproject aws-helm-kubernetes-tools
