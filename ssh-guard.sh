#!/bin/bash

# Function to list failed SSH login attempts
list_failed_logins() {
  echo "[INFO] Listing all failed SSH login attempts..."
  sudo journalctl -u ssh --since "1 week ago" | grep "Failed password" | \
    awk '{print $1, $2, $3, $11}' | \
    sort | \
    uniq -c | \
    sort -n
}

# Function to list successful SSH logins
list_successful_logins() {
  echo "[INFO] Listing all successful SSH logins..."
  sudo journalctl -u ssh --since "1 week ago" | grep "Accepted password" | \
    awk '{print $1, $2, $3, $11}' | \
    sort
}

# Function to list both successful and failed SSH logins
list_both_logins() {
  echo "[INFO] Listing all failed SSH login attempts..."
  sudo journalctl -u ssh --since "1 week ago" | grep "Failed password" | \
    awk '{print $1, $2, $3, $11}' | \
    sort | \
    uniq -c | \
    sort -n

  echo "[INFO] Listing all successful SSH logins..."
  sudo journalctl -u ssh --since "1 week ago" | grep "Accepted password" | \
    awk '{print $1, $2, $3, $11}' | \
    sort
}

# Function to display the menu and prompt for user selection
show_menu() {
  clear
  echo "==================================="
  echo "       SSH Log Monitoring Script   "
  echo "==================================="
  echo "1. List Failed SSH Attempts"
  echo "2. List Successful SSH Logins"
  echo "3. List Both Failed and Successful SSH Logins"
  echo "4. Quit"
  echo "==================================="
  read -p "Please select an option (1-4): " option
}

# Main loop to handle the menu options
while true; do
  show_menu

  case $option in
    1)
      list_failed_logins
      ;;
    2)
      list_successful_logins
      ;;
    3)
      list_both_logins
      ;;
    4)
      echo "Exiting the script. Goodbye!"
      break
      ;;
    *)
      echo "Invalid option. Please try again."
      ;;
  esac

  # Wait for user input before showing the menu again
  read -p "Press [Enter] to continue..." 
done
