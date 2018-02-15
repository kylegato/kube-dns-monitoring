# kube-dns-monitoring
Basic docker image that runs an host lookup against the kube-dns service running in the kube-system namespace every 30 seconds to ensure DNS is functioning correctly, otherwise outputs an error to stdout.


## Usage
Run it as a daemonset in the kube-system namespace.

```
kubectl create -f ./kube-dns-monitoring-ds.yaml
```

## Monitoring
1. Check the pod for # of restarts (EX: kubectl -n kube-system get pods | grep kube-dns-monitoring)
2. Use your favorite log aggregator (Splunk/LogDNA/Papertrail) to setup alerts on the output from the script

## Sample outputs:

DNS Okay:
```
1518716342 - Thu Feb 15 17:39:02 UTC 2018 - OK: DNS working as expected.
```

DNS Not Okay:
```
1518716173 - Thu Feb 15 17:36:13 UTC 2018 - ERROR: DNS Lookup for kube-dns.kube-system.svc.cluster.local failed.
```
