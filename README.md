# Fluentd Kubernetes Gelf

![Fluentd Logo](http://www.fluentd.org/assets/img/miscellany/fluentd-logo.png)
![Kubernetes Logo](https://sematext.com/wp-content/uploads/2016/11/kubernetes-logo.png)

## Supported docker image

- [`elasticio/fluentd-kubernetes-gelf`](https://hub.docker.com/r/elasticio/fluentd-kubernetes-gelf/)

## What is Fluentd?

Fluentd is an open source data collector, which lets you unify the data collection and consumption for a better use and understanding of data ([www.fluentd.org](http://www.fluentd.org/))

## Image versions

This image is based on the popular [Alpine Linux project][1], available in [the alpine official image][2].
Alpine Linux is much smaller than most distribution base images (~5MB), and
thus leads to much slimmer images in general.

[1]: http://alpinelinux.org
[2]: https://hub.docker.com/_/alpine

### References

[Kubernetes Logging with Fluentd][3]

## Build docker image

Based on the provided Dockerfile you can build and customize the docker image

## Kubernetes daemonset

To install the daemonset on your Kubernetes cluster adap the yaml example and simply:

```
kubectl create -f fluentd-daemonset-gelf.yaml
```

[1]: http://alpinelinux.org
[2]: https://hub.docker.com/_/alpine
[3]: http://docs.fluentd.org/v0.12/articles/kubernetes-fluentd
