#!/bin/bash

echo "===== System Health Snapshot ====="
echo "Date & Time: $(date)"
echo "Hostname: $(hostname)"
echo "Current User: $(whoami)"
echo
echo "Disk Usage (Root):"
df -h /

