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
![alt text](<assets/img/Screenshot From 2026-10-30 15-40-52.png>)

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
Total requests ........ 5000
Unique visitors ....... 10
2xx / 3xx ............. 3932 / 177
4xx / 5xx ............. 794 / 97
Data sent ............. 33.9 MB

Top 5 pages
      4 /index.html
      4 /about.html
      3 /missing.html
      3 /images/logo.png
      3 /css/style.css

Top 5 IP addresses
      513 154.73.4.200
        512 41.202.219.70
        508 41.211.10.8
        505 102.244.1.9
        500 154.72.160.3

Top 5 broken links (404)
    351 /blog/bash-tips
    312 /old-page
     27 /index.html
     26 /css/style.css
     15 /curriculum.pdf
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
