# Fluentd + Kubernetes + GELF

_The repo was forked because of old images from the original author._
_This fork is built from the latest fluentd images and has some fixes for running on the latest Kubernetes._

Link to Docker image - [`elasticio/fluentd-kubernetes-gelf`](https://hub.docker.com/r/elasticio/fluentd-kubernetes-gelf)

## What is Fluentd?

Fluentd is an open source data collector, which lets you unify the data collection and consumption for a better use and understanding of data ([www.fluentd.org](http://www.fluentd.org))

## Image versions

This image is based on the popular [Alpine Linux project](http://alpinelinux.org), available in [the alpine official image](https://hub.docker.com/_/alpine).
Alpine Linux is much smaller than most distribution base images (~5MB), and
thus leads to much slimmer images in general.

## Kubernetes DaemonSet

To install the DaemonSet on your Kubernetes cluster, use the `yaml` example, in the root of the repository, in console or upload it via Kubernetes Dashboard:

```
kubectl create -f fluentd-daemonset-gelf.yaml
```

## Configuration

### Graylog Endpoint

Inside the descriptor for Kubernetes DaemonSet, you need to specify host, port and protocol:

```yaml
- name: GELF_HOST 
  value: "<HOST>"
- name: GELF_PORT
  value: "<PORT>"
- name: GELF_PROTOCOL
  value: "{tcp,udp}"
```

### Fluentd Configuration

All the inputs, transforms and outputs are configured in `./conf/kubernetes.conf` file.

If you need to update something there, use the reference from Fluentd website or related plugin.

## References

- [Kubernetes Logging with Fluentd](http://docs.fluentd.org/v0.12/articles/kubernetes-fluentd)
- [Input Plugin Overview](https://docs.fluentd.org/v1.0/articles/input-plugin-overview)
- [Output Plugin Overview](https://docs.fluentd.org/v1.0/articles/output-plugin-overview)
- [Plugin for GELF output](https://github.com/bodhi-space/fluent-plugin-gelf-hs)
- [Plugin for Kubernetes Metadata](https://github.com/fabric8io/fluent-plugin-kubernetes_metadata_filter)