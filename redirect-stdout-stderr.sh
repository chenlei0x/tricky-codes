#!/bin/bash
LOG_FILE=l.log
# Link file descriptor #6 with stdout. Saves stdout.
function store_stdout_stderr()
{
	exec 6>&1
	exec 7>&2
}

function redirect_stdout()
{
	LOG_FILE=$1
	# Close STDOUT file descriptor
	exec 1<&-
	# Open STDOUT as $LOG_FILE file for read and write.
	exec 1<>$LOG_FILE
}

function redirect_stderr()
{
	LOG_FILE=$1
	# Close STDERR FD
	exec 2<&-
	# Redirect STDERR to STDOUT
	exec 2<>$LOG_FILE
}

function redirect_stderr_stdout()
{
	LOG_FILE=$1
	redirect_stdout $LOG_FILE
	exec 2>&1
}

function restore_stdout_stderr()
{
	exec 1>&6 6>&-
	exec 2>&7 7>&-
}

store_stdout_stderr $LOG_FILE
redirect_stderr_stdout $LOG_FILE
echo "This line will appear in $LOG_FILE, not 'on screen'"
restore_stdout_stderr

#restore STDERR and STDOUT
echo "== stdout now restored to default == "

