import sys
import argparse
from jnpr.junos import Device
from jnpr.junos.exception import ConnectError
from jnpr.junos.utils.config import Config


def push_junos_config(ip, username, password):
    try:
        with Device(host=ip, user=username, passwd=password) as dev:
            print(f"[INFO] Connected to {ip}")

            with Config(dev, mode="private") as cu:
                cu.load(
                    "set system host-name Terraform-Junos",
                    format="set"
                )
                cu.commit()
                print("[INFO] Configuration committed successfully")
    except ConnectError as e:
        print(f"[ERROR] Failed to connect to {ip}: {e}")
        sys.exit(1)
    except Exception as e:
        print(f"[ERROR] Unexpected error: {e}")
        sys.exit(1)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(
        description="Push basic hostname config to a Junos device"
    )
    parser.add_argument("ip", help="Device IP address")
    parser.add_argument("username", help="NETCONF username")
    parser.add_argument("password", help="NETCONF password")
    args = parser.parse_args()

    push_junos_config(args.ip, args.username, args.password)
