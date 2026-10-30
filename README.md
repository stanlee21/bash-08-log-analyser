# Log Analyser

## Problem Statement

Server access logs contain useful information about website traffic, errors, and performance. However, analysing thousands of raw log entries manually is time-consuming.

This project provides a Bash script that analyses server access logs and generates a readable report.

## Project Goals

- Automate the analysis of server access logs.
- Identify visitor activity and frequently requested pages.
- Track HTTP response status codes.
- Identify broken links (404 errors).
- Calculate the total amount of data transferred.

## Tech Stack

- **Bash** – scripting and automation.
- **AWK** – extracting and calculating log statistics.
- **Linux commands** – `sort`, `uniq`, `wc`, `head`, and `printf`.
- **Git and GitHub** – version control.

## Features

- Validates input arguments and log files.
- Counts total requests and unique visitors.
- Groups HTTP responses into 2xx, 3xx, 4xx, and 5xx.
- Displays the top 5 requested pages.
- Displays the top 5 visitor IP addresses.
- Identifies the top 5 broken links.
- Calculates total data transferred in MB.
- Handles empty log files gracefully.
- Organises report sections into reusable Bash functions.

## Screenshots

### Script Code
<!-- Add a screenshot of your loganalyse.sh code here -->
![alt text](<assets/img/Screenshot From 2026-10-30 14-24-28.png>)

### Program Output
<!-- Add a screenshot of your terminal output here -->
![alt text](<assets/img/Screenshot From 2026-10-30 14-25-32.png>)

## Installation and Setup

Clone the repository:

```bash
git clone https://github.com/stanlee21/bash-08-log-analyser.git
```

Navigate into the project directory:

```bash
cd bash-08-log-analyser
```

Make the script executable:

```bash
chmod +x loganalyse.sh
```

Run the analyser:

```bash
./loganalyse.sh access.log
```

For a development test log, you can generate 20 sample entries using the included helper script:

```bash
chmod +x make-sample-log.sh
./make-sample-log.sh 20 > small.log
./loganalyse.sh small.log
```

*Note: The generated sample log is for development and testing. It is not the official Appendix F dataset.*

## Sample Output

Example generated using a 20-line test log:

```text
==========================================
Log report: small.log
==========================================
Total requests ........ 20
Unique visitors ....... 5
2xx / 3xx ............. 11 / 3
4xx / 5xx ............. 3 / 3
Data sent ............. 0.0 MB

Top 5 pages
      4 /index.html
      4 /about.html
      3 /missing.html
      3 /images/logo.png
      3 /css/style.css

Top 5 IP addresses
      4 192.168.1.14
      4 192.168.1.13
      4 192.168.1.12
      4 192.168.1.11
      4 192.168.1.10

Top 5 broken links (404)
      3 /images/logo.png
```

## What I Learned

- Writing and organising Bash scripts using functions.
- Processing structured text using AWK.
- Combining Linux commands through pipelines.
- Validating command-line arguments and files.
- Calculating statistics from server logs.
- Testing scripts with different input conditions.
- Using Git branches and commits to manage project development.

## Author

**Tata Stanley Mbajing**  
Junior Frontend Developer
**Email:** [stanleymbajingtata@gmail.com]
