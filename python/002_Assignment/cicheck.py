import os

import subprocess

import sys

import unittest

def run_command(command):

  """Executes a shell command and returns the output and exit code."""

  print(f"Running: {command}")

  result = subprocess.run(command, shell=True, capture_output=True, text=True)

  print(result.stdout)

  if result.stderr:

    print(result.stderr, file=sys.stderr)

  return result.returncode

def run_tests():

  """Runs all unit tests and returns the exit code."""

  print("Running unit tests...")

  return run_command("python -m unittest discover -s tests")

def main():

  """Main function to execute CI steps."""

  print("Starting Continuous Integration Process...\n")

  # Step 1: Pull the latest code (if using Git)

  if os.path.exists(".git"):

    print("Fetching latest code from Git...")

    if run_command("git pull origin main") != 0:

      print("Failed to pull latest code. Exiting.")

      sys.exit(1)

  # Step 2: Run Tests

  if run_tests() != 0:

    print("Tests failed! Fix errors before merging.")

    sys.exit(1)

  print("\n✅ Continuous Integration completed successfully!")

if __name__ == "__main__":

  main()















