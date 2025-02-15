import os

def restart_process(process):
    """Restart an application process."""
    try:
        process.terminate()
        process.wait()
        os.system(f"{process.name()} &")  # Restarting the process
        print(f"Restarted application process: {process.name()} (PID: {process.pid})")
    except Exception as e:
        print(f"Error restarting process {process.name()}: {e}")


def kill_process(process):
    """Kill an unknown process."""
    try:
        # process.kill()
        print(f"Killed unknown process: {process.name()} (PID: {process.pid})")
    except Exception as e:
        print(f"Error killing process {process.name()}: {e}")