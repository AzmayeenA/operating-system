#!/bin/bash

echo "Top 5 processes using the most memory:"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6

