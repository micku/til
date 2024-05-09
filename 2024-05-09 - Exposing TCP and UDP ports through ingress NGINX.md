---
title: Exposing TCP and UDP ports through ingress NGINX
date: 2024-05-09
tags:
  - kubernetes
---
It is possible to expose ports other than 80 and 443 through the NGINX ingress in Kubernetes.

An example where this is needed is a [DNS](https://www.cloudflare.com/learning/dns/what-is-dns/) server which uses port 53 on both TCP and UDP. [Pi-hole](https://pi-hole.net/) is a widely self-hosted DNS server that also works as an ad-blocker.

The way to expose those ports is, in a couple of points:
1. Define the app that implements the service and exposes the ports to the cluster via a Kubernetes service;
2. Configure the NGINX ingress controller to accept incoming requests from the ports, and forward them to the service.

There are a couple of caveats:
- NGINX supports [UDP load balancing](https://www.nginx.com/blog/announcing-udp-load-balancing/) since version 1.9.13;
- Cannot route traffic based on host, only 1 service in the cluster can be exposed with this method;
- There is a [bug](https://github.com/kubernetes/kubernetes/issues/105610#issue-1022865402) on the `kubectl` client that prevents setting the same service ports on both protocols, if using `apply`, you can use the parameter `--server-side=true` to mitigate the issue.

Source: https://kubernetes.github.io/ingress-nginx/user-guide/exposing-tcp-udp-services/
