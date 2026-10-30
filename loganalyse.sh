#!/bin/bash
#
# loganalyse.sh - Analyse website server access logs
# Usage: ./loganalyse.sh LOGFILE


# 1. Check the input file
check_file() {

    if [[ $# -ne 1 ]]; then
        echo "Usage: $0 LOGFILE" >&2
        exit 1
    fi

    logfile="$1"

    if [[ ! -f "$logfile" ]]; then
        echo "Error: File does not exist: $logfile" >&2
        exit 1
    fi

    if [[ ! -r "$logfile" ]]; then
        echo "Error: File is not readable: $logfile" >&2
        exit 1
    fi
}


# 2. Print total requests
print_total_requests() {

    total_requests=$(wc -l < "$logfile")

    printf "Total requests ........ %s\n" "$total_requests"
}


# 3. Print unique visitors
print_unique_visitors() {

    unique_visitors=$(awk '{print $1}' "$logfile" | sort -u | wc -l)

    printf "Unique visitors ....... %s\n" "$unique_visitors"
}


# 4. Print HTTP status codes
print_status_codes() {

    count_2xx=$(awk '$9 ~ /^2[0-9][0-9]$/ {count++} END {print count+0}' "$logfile")

    count_3xx=$(awk '$9 ~ /^3[0-9][0-9]$/ {count++} END {print count+0}' "$logfile")

    count_4xx=$(awk '$9 ~ /^4[0-9][0-9]$/ {count++} END {print count+0}' "$logfile")

    count_5xx=$(awk '$9 ~ /^5[0-9][0-9]$/ {count++} END {print count+0}' "$logfile")

    printf "2xx / 3xx ............. %s / %s\n" "$count_2xx" "$count_3xx"
    printf "4xx / 5xx ............. %s / %s\n" "$count_4xx" "$count_5xx"
}


# 5. Print top 5 requested pages
print_top_pages() {

    echo
    echo "Top 5 pages"

    awk '{print $7}' "$logfile" |
        sort |
        uniq -c |
        sort -rn |
        head -5
}


# 6. Print top 5 visitor IP addresses
print_top_ips() {

    echo
    echo "Top 5 IP addresses"

    awk '{print $1}' "$logfile" |
        sort |
        uniq -c |
        sort -rn |
        head -5
}


# 7. Print top 5 broken links (404)
print_top_404() {

    echo
    echo "Top 5 broken links (404)"

    awk '$9 == 404 {print $7}' "$logfile" |
        sort |
        uniq -c |
        sort -rn |
        head -5
}


# 8. Calculate total data sent
print_data_sent() {

    data_sent=$(awk '{total += $10} END {printf "%.1f", total / 1048576}' "$logfile")

    printf "Data sent ............. %s MB\n" "$data_sent"
}


# 9. Main function
main() {

    check_file "$@"

    echo "=========================================="
    echo "Log report: $logfile"
    echo "=========================================="

    # Handle an empty file
    if [[ ! -s "$logfile" ]]; then
        echo "No data available in this log file."
        return 0
    fi

    print_total_requests
    print_unique_visitors
    print_status_codes
    print_data_sent

    print_top_pages
    print_top_ips
    print_top_404
}


# Execute the program
main "$@"
