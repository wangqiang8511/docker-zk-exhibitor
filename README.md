# Zookeeper Exhibitor

Simple docker image for zookeeper with exhibitor enabled.

Using 

* zookeeper 3.4.6
* exhibitor 1.5.5

# How to use

## Build Image

```bash
./build
```

## Setup local testing instance.

```bash
# Start one local container
./hack/start_standalone_zk_s3.sh

# Start three local containers
./hack/start_resolvable.sh
./hack/start_cluster_s3.sh
```

# Reference

[zookeeper](https://zookeeper.apache.org/)
[exhibitor](https://github.com/Netflix/exhibitor/wiki)
