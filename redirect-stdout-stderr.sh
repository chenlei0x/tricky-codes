#!/bin/bash
LOG_FILE=/tmp/lvm.log
# Link file descriptor #6 with stdout. Saves stdout.
exec 6>&1
exec 7>&2

# Close STDOUT file descriptor
exec 1<&-
# Close STDERR FD
exec 2<&-

# Open STDOUT as $LOG_FILE file for read and write.
exec 1<>$LOG_FILE

# Redirect STDERR to STDOUT
exec 2>&1
echo "This line will appear in $LOG_FILE, not 'on screen'"



#restore STDERR and STDOUT
exec 1>&6 6>&-
exec 2>&7 7>&-
echo "== stdout now restored to default == "

