import sys
import time
import argparse
import paramiko

def push_config(ip, username, password):
    commands = [
        'conf t',
        'hostname Terraform-IOS',
        'end',
        'write memory'
    ]

    try:
        ssh = paramiko.SSHClient()
        ssh.set_missing_host_key_policy(paramiko.AutoAddPolicy())
        ssh.connect(ip, username=username, password=password)
    except Exception as e:
        print(f"[ERROR] SSH connection failed: {e}")
        sys.exit(1)

    shell = ssh.invoke_shell()

    print(f"[INFO] Connected to {ip}. Pushing configuration...")

    for cmd in commands:
        shell.send(cmd + '\n')
        time.sleep(1)  # Allow device time to process command

        # Read output (optional but useful)
        if shell.recv_ready():
            output = shell.recv(5000).decode()
            print(output)

    shell.close()
    ssh.close()
    print("[INFO] Configuration applied and session closed.")


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Push basic config to Cisco IOS device")
    parser.add_argument("ip", help="Device IP address")
    parser.add_argument("username", help="SSH username")
    parser.add_argument("password", help="SSH password")
    
    args = parser.parse_args()
    push_config(args.ip, args.username, args.password)
