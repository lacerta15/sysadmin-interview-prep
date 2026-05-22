# Cloudera CDP Interview Questions

**Q: HDFS NameNode is in safe mode. What do you do?**
```bash
hdfs dfsadmin -safemode get
hdfs dfsadmin -safemode leave   # manual exit (use carefully)
# Check under-replicated blocks:
hdfs dfsadmin -report | grep "Under replicated"
```

**Q: YARN jobs are queuing. How to investigate?**
```bash
# Check queue utilization
yarn queue -status root.default
# Check running apps
yarn application -list -appStates RUNNING | wc -l
# Check ResourceManager log
tail -f /var/log/hadoop-yarn/yarn-yarn-resourcemanager-*.log
```

**Q: How to add a new node to a Cloudera cluster?**
1. Install Cloudera Agent on new host
2. Configure CM server URL in agent config
3. In Cloudera Manager: Hosts > Add Hosts
4. Assign roles (DataNode, NodeManager)
5. Start roles and run HDFS Rebalancer
