#!/bin/bash

# Generate sample server access logs

if [[ $# -ne 1 || ! $1 =~ ^[0-9]+$ ]]; then
    echo "Usage: $0 NUMBER_OF_LINES" >&2
    exit 1
fi

count=$((10#$1))

# Sample visitor IP addresses
ips=(
    "192.168.1.10"
    "192.168.1.11"
    "192.168.1.12"
    "192.168.1.13"
    "192.168.1.14"
)

# Sample requested pages
pages=(
    "/index.html"
    "/about.html"
    "/contact.html"
    "/css/style.css"
    "/images/logo.png"
    "/missing.html"
)

# HTTP status codes
statuses=(200 200 200 301 404 500)

# Response sizes in bytes
sizes=(2048 1024 512 4096 256 128)

# Generate the requested number of log entries
for ((i = 1; i <= count; i++)); do

    index=$(( (i - 1) % 6 ))
    ip_index=$(( (i - 1) % 5 ))

    printf '%s - - [30/Oct/2026:10:00:00 +0100] "GET %s HTTP/1.1" %s %s\n' \
        "${ips[$ip_index]}" \
        "${pages[$index]}" \
        "${statuses[$index]}" \
        "${sizes[$index]}"

done
