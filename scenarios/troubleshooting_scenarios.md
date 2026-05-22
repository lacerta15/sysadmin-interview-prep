# Troubleshooting Scenarios

## Scenario 1: Production web server not responding
Steps:
1. Check if process is running: `systemctl status httpd`
2. Check port: `ss -tlnp | grep 80`
3. Check firewall: `firewall-cmd --list-all`
4. Check SELinux: `getsebool -a | grep http`
5. Check logs: `tail -f /var/log/httpd/error_log`
6. Check connectivity: `curl -v localhost`

## Scenario 2: Disk space full on data node
Steps:
1. Find large files: `find / -size +1G -not -path '/proc/*' 2>/dev/null | sort -k5 -rn`
2. Check HDFS trash: `hdfs dfs -du -h /user/*/. Trash`
3. Empty trash: `hdfs dfs -expunge`
4. Check HDFS block scanner logs
5. Add capacity or rebalance

## Scenario 3: Kubernetes pod stuck Pending
Steps:
1. `kubectl describe pod <name>` → check Events
2. Look for: Insufficient CPU/memory, no matching nodes, PVC unbound
3. `kubectl get nodes` → check node status
4. `kubectl describe node <node>` → check conditions and allocatable
5. Fix resource requests or add nodes
