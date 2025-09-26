#!/bin/bash
# Script para crear, habilitar y ejecutar el servicio remove-kvm.service

SERVICE_FILE="/etc/systemd/system/remove-kvm.service"

# Crear el servicio
sudo tee $SERVICE_FILE > /dev/null << 'EOF'
[Unit]
Description=Remove KVM modules at boot
After=multi-user.target

[Service]
Type=oneshot
ExecStart=/bin/bash -c "rmmod kvm_intel || true; rmmod kvm || true"

[Install]
WantedBy=multi-user.target
EOF

# Recargar systemd y habilitar el servicio
sudo systemctl daemon-reload
sudo systemctl enable remove-kvm.service

# Ejecutar el servicio inmediatamente
sudo systemctl start remove-kvm.service

echo "✅ Servicio remove-kvm.service creado, habilitado y ejecutado."
