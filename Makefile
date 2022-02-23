##ISTIO
istio-setup:
	curl -L https://istio.io/downloadIstio | sh -
istio-setup-mac:
	brew install istioctl

istio-setup: istio-install istio-install-ingress
#!!!!До установки ингресса надо добавить роль для мастер и воркер нод в ami aws - https://istio.io/latest/blog/2018/aws-nlb/ !!!
istio-install:
	istioctl install --set profile minimal
istio-install-ingress: helm install istio-ingress ./Istio/istio-ingress -n istio-system -f ./Istio/istio-ingress/values.yaml
