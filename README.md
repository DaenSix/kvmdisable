This script creates, enables, and runs a systemd service called remove-kvm.service.
The purpose of the service is to remove KVM kernel modules (kvm_intel and kvm) at system startup to prevent them from loading automatically.

What it does:

Creates the systemd service file at /etc/systemd/system/remove-kvm.service.

Configures the service to run once at boot (Type=oneshot).

Uses rmmod to remove kvm_intel and kvm modules (ignores errors if they’re not loaded).

Reloads systemd to apply changes.

Enables the service so it runs automatically at every boot.

Starts the service immediately without requiring a reboot.
