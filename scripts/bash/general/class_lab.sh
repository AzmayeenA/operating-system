#!/bin/bash
# class_lab.sh - Bash commands from BashCommands.txt.docx

# --- Part I: The Challenges ---

# Processes & Daemons
# 1. List all running processes associated with nginx
ps aux | grep nginx

# 2. Kill all processes named my_script.sh
pkill -f my_script.sh

# 3. Run backup.sh in the background and detach
nohup ./backup.sh &

# 4. Extract PID of sshd daemon
pidof sshd

# 5. View processes in a tree format
pstree -p

# 6. List all files opened by PID 1234
lsof -p 1234

# 7. Check if docker daemon is active
systemctl is-active docker

# 8. Start heavy_calc.sh with lowest CPU priority
nice -n 19 ./heavy_calc.sh

# Files, Copying & Archiving
# 9. Recursive copy
cp -r /var/www/html /backup/html

# 10. Preserve attributes
cp -p secret.key /tmp/

# 11. Sync directories using rsync
rsync -au src/ dest/

# 12. Update copy only if newer
cp -u dir1/* dir2/

# 13. Remote copy using scp
scp app.conf user@192.168.1.50:/etc/

# 14. Archive & compress /var/log
tar -czvf log_backup.tar.gz /var/log

# The find Command
# 15. Find files larger than 500MB
find /home -type f -size +500M

# 16. Find files modified in last 7 days
find /var/log -type f -mtime -7

# 17. Find files owned by user jenkins
find /tmp -user jenkins

# 18. Delete empty directories inside /data
find /data -type d -empty -delete

# 19. Find files with 777 permissions
find . -type f -perm 777

# 20. Find .jpg files and copy to /images/
find . -type f -name "*.jpg" -exec cp {} /images/ \;

# Regular Expressions (grep, sed, awk)
# 21. Extract emails from contacts.txt
grep -E -o "[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,6}" contacts.txt

# 22. Case-insensitive search for "error"
grep -i "error" syslog

# 23. Lines starting with "root"
grep "^root" config.ini

# 24. Invert match for IP 192.168.1.1
grep -v "192.168.1.1" access.log

# 25. Recursive grep for "TODO"
grep -r "TODO" .

# 26. Sed replace localhost -> 127.0.0.1
sed -i 's/localhost/127.0.0.1/g' hosts.txt

# 27. Comment removal (lines starting with #)
grep -v "^#" configfile.txt

# 28. IPv4 address validation
grep -E "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" somefile.txt

# Complex Combinations
# 29. List all running processes as root
ps aux | grep "^root"

# 30. Find *.log files, search for "Critical" and print filename
find . -type f -name "*.log" -exec grep -l "Critical" {} \;

