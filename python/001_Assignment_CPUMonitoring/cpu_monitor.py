import psutil
import smtplib
import os
import time
from email.mime.text import MIMEText


from send_email import send_email
from kill_restart import kill_process,restart_process



# Configuration
CPU_THRESHOLD = 2.0  # CPU usage threshold

CHECK_INTERVAL = 5  # Seconds




def monitor_cpu_usage():
    """Monitor CPU usage and take actions if it exceeds the threshold."""
    while True:
        cpu_usage = psutil.cpu_percent(interval=1)
        if cpu_usage > CPU_THRESHOLD:
            print(f"High CPU Usage Detected: {cpu_usage}%")
            for process in psutil.process_iter(attrs=['pid', 'name', 'cpu_percent']):
                try:
                    if process.info['cpu_percent'] > 10:  # Filter out low CPU-consuming processes
                        pid = process.info['pid']
                        name = process.info['name']
                        usage = process.info['cpu_percent']

                        if name.lower() in ["systemd", "svchost.exe", "init"]:
                            send_email(name, pid, usage)  # System process: send an email
                        elif name.lower() in ["chrome", "firefox", "my_app"]:
                            restart_process(psutil.Process(pid))  # Application process: restart
                        else:
                            # kill_process(psutil.Process(pid))  # Unknown process: kill
                            send_email(name, pid, usage) 
                except (psutil.NoSuchProcess, psutil.AccessDenied, psutil.ZombieProcess):
                    pass
        else:
            print(f"CPU usage normal: {cpu_usage}%")
        time.sleep(CHECK_INTERVAL)


if __name__ == "__main__":
    monitor_cpu_usage()
