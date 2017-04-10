# Fluentd Kubernetes Gelf

## Supported docker image

- [`xbernpa/fluentd-kubernetes-gelf`](https://hub.docker.com/r/xbernpa/fluentd-kubernetes-gelf/)

## What is Fluentd?

Fluentd is an open source data collector, which lets you unify the data
collection and consumption for a better use and understanding of data.

> [www.fluentd.org](http://www.fluentd.org/)

![Fluentd Logo](http://www.fluentd.org/assets/img/miscellany/fluentd-logo.png)


## Image versions

This image is based on the popular [Alpine Linux project][1], available in
[the alpine official image][2].
Alpine Linux is much smaller than most distribution base images (~5MB), and
thus leads to much slimmer images in general.


[1]: http://alpinelinux.org
[2]: https://hub.docker.com/_/alpine

### References

[Kubernetes Logging with Fluentd][3]

## Build docker image

Based on the provided Dockerfile you can build and customize the docker image

## Kubernetes daemonset

To install the daemonset on your Kubernetes cluster adap the yaml example and simply :
```
kubectl create -f kubernetes/fluentd-daemonset-gelf.yaml
```

[1]: http://alpinelinux.org
[2]: https://hub.docker.com/_/alpine
[3]: http://docs.fluentd.org/v0.12/articles/kubernetes-fluentd
