#!/bin/bash
#Usage:To implement CPU usage monitoring and take appropriate action
#Author:Aniruddha Das

CPU_THRESHOLD=10  # CPU usage threshold
EMAIL_RECIPIENT = "aniruddhadas371@gmail.com"  # Set recipient email
EMAIL_SENDER = "aniruddhadas030502@gmail.com"
EMAIL_PASSWORD = "urhz isdn wypy nwyc"

SMTP_SERVER="smtp.gmail.com"
CHECK_INTERVAL=5  # Seconds

export EMAIL_RECIPIENT
export EMAIL_SENDER
export EMAIL_PASSWORD

send_email() {
    local process_name=$1
    local pid=$2
    local cpu_usage=$3
    
    echo -e "Subject: High CPU Usage Alert: $process_name\n\nProcess $process_name (PID: $pid) is consuming $cpu_usage% CPU." |
        sendmail -v -S "$SMTP_SERVER" -f "$EMAIL_SENDER" -au"$EMAIL_SENDER" -ap"$EMAIL_PASSWORD" "$EMAIL_RECIPIENT"
    echo "Email alert sent for $process_name (PID: $pid)"
}

restart_process() {
    local pid=$1
    local process_name=$2
    
    kill "$pid"
    sleep 2
    nohup "$process_name" &
    echo "Restarted application process: $process_name (PID: $pid)"
}

kill_process() {
    local pid=$1
    
    kill -9 "$pid"
    echo "Killed unknown process (PID: $pid)"
}

monitor_cpu_usage() {
    if ! command -v top &> /dev/null; then
        echo "Error: 'top' command not found. Please install 'procps' package."
        exit 1
    fi
    
    while true; do
        cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
        cpu_usage_int=${cpu_usage%.*}  # Convert to integer for comparison
        
        if (( cpu_usage_int > CPU_THRESHOLD )); then
            echo "High CPU Usage Detected: $cpu_usage%"
            
            ps -eo pid,comm,%cpu --sort=-%cpu | awk 'NR>1 {if ($3 > 10) print $1, $2, $3}' | while read -r pid process_name usage; do
                if [[ "$process_name" =~ ^(systemd|init|svchost)$ ]]; then
                    send_email "$process_name" "$pid" "$usage"
                elif [[ "$process_name" =~ ^(chrome|firefox|my_app)$ ]]; then
                    restart_process "$pid" "$process_name"
                else
                    kill_process "$pid"
                fi
            done
        else
            echo "CPU usage normal: $cpu_usage%"
        fi
        sleep "$CHECK_INTERVAL"
    done
}

monitor_cpu_usage