#!/bin/bash


# 1. Check the number of arguments
if [[ $# -ne 1 ]]; then
    echo "Usage: $0 LOGFILE" >&2
    exit 1
fi

# 2. Store the supplied filename
logfile="$1"

# 3. Check whether the file exists
if [[ ! -f "$logfile" ]]; then
    echo "Error: File does not exist: $logfile" >&2
    exit 1
fi

# 4. Check whether the file is readable
if [[ ! -r "$logfile" ]]; then
    echo "Error: File is not readable: $logfile" >&2
    exit 1
fi

# 5. Count total requests
total_requests=$(wc -l < "$logfile")

# 6. Count unique visitors
unique_visitors=$(awk '{print $1}' "$logfile" | sort -u | wc -l)

# 7. Display the results
echo "=========================================="
echo "Log report: $logfile"
echo "=========================================="
echo "Total requests: $total_requests"
echo "Unique visitors: $unique_visitors"
