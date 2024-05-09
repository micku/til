---
title: Exposing TCP and UDP ports through ingress NGINX
date: 2024-05-09
tags:
  - kubernetes
---
It is possible to expose ports other than 80 and 443 through the Nginx ingress in Kubernetes.

Let's use the DNS as an example (useful for setting up [Pi-hole](https://pi-hole.net/)) to see how it works, from the bottom of the chain:
- The app deployment defines the port(s) a container wants to expose, in this case port 53 both UTP and TCP:
  ```
  ...
  ports:
  - containerPort: 53
    name: dns
    protocol: TCP
  - containerPort: 53
    name: dns-udp
    protocol: UDP
  ...

  ```
- Those are then exposed to the cluster through a service, the `name` in the deployment must match the `targetPort` in the service:
  ```
  spec:
    type: ClusterIP
    ports:
    - name: dns
      port: 53
      targetPort: dns
      protocol: TCP
    - name: dns-udp
      port: 53
      targetPort: dns-udp
      protocol: UDP
  ...
  ```
- The ingress has a feature which forwards incoming requests on specific ports to an underlying service. To do so we need to:
	- Create the configfiles that map the port to the service, there must be one for TCP and one for UDP:
	- Add the reference to these configfiles to the Nginx controller startup command:

Source: 
