# This script deploys knative-serving for local development.
ko apply --selector knative.dev/crd-install=true -Rf config/core/
k wait --for=condition=Established --all crd

ko apply -Rf config/core/

ko delete -f config/post-install/default-domain.yaml --ignore-not-found
ko apply -f config/post-install/default-domain.yaml

# ko apply -f config/core/deployments/controller.yaml
# ko apply -f config/core/deployments/autoscaler.yaml