from email.mime.text import MIMEText
import smtplib



EMAIL_RECIPIENT = "aniruddhadas371@gmail.com"  # Set recipient email
EMAIL_SENDER = "aniruddhadas030502@gmail.com"
EMAIL_PASSWORD = "urhz isdn wypy nwyc"

def send_email(process_name, pid, cpu_usage):
    """Send an email notification for system processes consuming high CPU."""
    subject = f"High CPU Usage Alert: {process_name}"
    body = f"Process {process_name} (PID: {pid}) is consuming {cpu_usage}% CPU."
    msg = MIMEText(body)
    msg["Subject"] = subject
    msg["From"] = EMAIL_SENDER
    msg["To"] = EMAIL_RECIPIENT
    
    try:
        with smtplib.SMTP("smtp.gmail.com", 587) as server:
            server.starttls()
            server.login(EMAIL_SENDER, EMAIL_PASSWORD)
            server.sendmail(EMAIL_SENDER, EMAIL_RECIPIENT, msg.as_string())
        print(f"Email alert sent for {process_name} (PID: {pid})")
    except Exception as e:
        print(f"Error sending email: {e}")