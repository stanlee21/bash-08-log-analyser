#!/bin/bash


# Check the number of arguments
if [[ $# -ne 1 ]]; then
    echo "Usage: $0 LOGFILE" >&2
    exit 1
fi

# Store the supplied filename
logfile="$1"

# Check whether the file exists
if [[ ! -f "$logfile" ]]; then
    echo "Error: File does not exist: $logfile" >&2
    exit 1
fi

# Check whether the file is readable
if [[ ! -r "$logfile" ]]; then
    echo "Error: File is not readable: $logfile" >&2
    exit 1
fi

# Count total requests
total_requests=$(wc -l < "$logfile")

# Count unique visitors
unique_visitors=$(awk '{print $1}' "$logfile" | sort -u | wc -l)


#Count HTTP status code categories

count_2xx=$(awk '$9 ~ /^2[0-9][0-9]$/ {count++} END {print count+0}' "$logfile")

count_3xx=$(awk '$9 ~ /^3[0-9][0-9]$/ {count++} END {print count+0}' "$logfile")

count_4xx=$(awk '$9 ~ /^4[0-9][0-9]$/ {count++} END {print count+0}' "$logfile")

count_5xx=$(awk '$9 ~ /^5[0-9][0-9]$/ {count++} END {print count+0}' "$logfile")


# Find the top 5 requested pages
top_pages=$(awk '{print $7}' "$logfile" | sort | uniq -c | sort -rn | head -5)

# Find the top 5 visitor IP addresses
top_ips=$(awk '{print $1}' "$logfile" | sort | uniq -c | sort -rn | head -5)

# Find the top 5 pages with 404 errors
top_404=$(awk '$9 == 404 {print $7}' "$logfile" | sort | uniq -c | sort -rn | head -5)



#Display the report

echo "=========================================="
echo "Log report: $logfile"
echo "=========================================="

echo "Total requests: $total_requests"
echo "Unique visitors: $unique_visitors"

echo "2xx responses: $count_2xx"
echo "3xx responses: $count_3xx"
echo "4xx responses: $count_4xx"
echo "5xx responses: $count_5xx"

echo
echo "Top 5 pages"
echo "$top_pages"

echo
echo "Top 5 IP addresses"
echo "$top_ips"

echo
echo "Top 5 broken links (404)"
echo "$top_404"

