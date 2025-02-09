# SSH Guard Script

This script is designed to monitor SSH login attempts on your server. It provides the option to list both successful and failed SSH logins along with the corresponding IP addresses and timestamps. You can also choose to list only one of the types of logins.

## Features

- **List Successful SSH Logins**: Displays the timestamp and IP address of all successful SSH logins.
- **List Failed SSH Login Attempts**: Displays the timestamp, IP address, and counts of failed login attempts.
- **List Both**: Displays both successful logins and failed login attempts in separate sections.

## Installation and Usage

Run the following commands to clone the repository, make the script executable, and execute it:

```bash
git clone https://github.com/GlitchLinux/ssh-guard.sh.git && \
cd ssh-guard.sh && \
chmod +x ssh-guard.sh && \
./ssh-guard.sh
