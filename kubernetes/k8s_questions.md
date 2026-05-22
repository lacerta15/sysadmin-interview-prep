# Kubernetes Interview Questions

## Core Concepts
**Q: Difference between Deployment, StatefulSet, and DaemonSet?**
- Deployment: stateless apps, pods are interchangeable
- StatefulSet: stateful apps, stable network identity and persistent storage (DBs)
- DaemonSet: runs one pod per node (node-exporter, fluentd)

**Q: Pod is in CrashLoopBackOff. How to debug?**
```bash
kubectl describe pod <pod-name>     # events section
kubectl logs <pod-name> --previous  # last crash logs
kubectl exec -it <pod-name> -- /bin/sh  # if pod is running briefly
# Check resource limits, liveness probes, image issues
```

**Q: How to do a zero-downtime rolling update?**
```bash
kubectl set image deployment/app container=image:v2
kubectl rollout status deployment/app
# Rollback if needed:
kubectl rollout undo deployment/app
```

## Networking
**Q: Explain Kubernetes networking model.**
- Every pod gets its own IP
- All pods can communicate with all other pods without NAT
- Nodes can communicate with all pods
- CNI plugins implement the model (Calico, Flannel, Cilium)
