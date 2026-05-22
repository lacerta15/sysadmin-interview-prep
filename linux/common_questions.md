# Linux Sysadmin Interview Questions

## Process Management
**Q: How do you find which process is using port 8080?**
```bash
ss -tlnp | grep 8080
# or
lsof -i :8080
# or
netstat -tlnp | grep 8080
```

**Q: How do you kill all processes matching a name?**
```bash
pkill -f process_name
# or
killall process_name
# graceful then force:
pkill -TERM -f name; sleep 5; pkill -KILL -f name
```

## Disk & Filesystem
**Q: Filesystem is full but no large files found. Why?**
```bash
# Check deleted-but-open files
lsof | grep deleted | awk '{print $7, $1, $2}' | sort -rn | head
# Restart the process holding the file to free space
```

**Q: How to extend an LVM volume online?**
```bash
lvextend -L +10G /dev/vg0/lv_data
xfs_growfs /data          # for XFS
# or
resize2fs /dev/vg0/lv_data  # for ext4
```

## Performance
**Q: System is slow. Walk through your diagnosis.**
```bash
uptime              # load average
top / htop          # CPU, memory per process
iostat -xz 1        # disk I/O
vmstat 1 5          # context switches, swapping
sar -n DEV 1 5      # network
dmesg | tail -20    # kernel messages
```
