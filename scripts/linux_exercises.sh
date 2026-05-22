#!/usr/bin/env bash
# Live coding exercises with solutions

echo "=== Exercise 1: Find top 5 memory-consuming processes ==="
ps aux --sort=-%mem | head -6 | awk '{printf "%-20s %6s%%\n", $11, $4}'

echo ""
echo "=== Exercise 2: Count unique IPs in auth log ==="
grep "Failed password" /var/log/secure 2>/dev/null     | awk '{print $(NF-3)}' | sort | uniq -c | sort -rn | head -10     || echo "(no /var/log/secure or no failures)"

echo ""
echo "=== Exercise 3: Find files modified in last 24h ==="
find /etc -mtime -1 -type f 2>/dev/null | head -20

echo ""
echo "=== Exercise 4: Disk usage top 10 directories ==="
du -h --max-depth=2 /var 2>/dev/null | sort -rh | head -10
