# Create file protonvpn.service
# Make sure you replace the Environment variable SUDO_USER with the 
# username where you installed and first called "protonvpn init"
sudo tee /etc/systemd/system/protonvpn.service <<EOF
[Unit]
Description=ProtonVPN CLI Auto-Start
After=network-online.target
Wants=network-online.target

[Service]
Type=forking
Environment=SUDO_USER=<user>
ExecStart=/usr/bin/protonvpn-cli last-connect  
ExecReload=/usr/bin/protonvpn-cli disconnect && /usr/bin/protonvpn-cli last-connect  
ExecStop=/usr/bin/protonvpn-cli disconnect*

[Install]
WantedBy=multi-user.target
EOF

sudo systemctl enable protonvpn.service
sudo systemctl daemon-reload
sudo systemctl restart protonvpn.service
