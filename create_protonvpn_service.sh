# Create file protonvpn.service
# Make sure you replace the Environment variable with the 
# username where you installed and first called "protonvpn init"
sudo tee /etc/systemd/system/protonvpn.service <<EOF
[Unit]
Description=ProtonVPN CLI Auto-Start
Wants=network-online.target

[Service]
Type=forking
Environment=SUDO_USER=<user where protonvpn is initialised>
ExecStart=/usr/local/bin/protonvpn c IS-DE#1
ExecReload=/usr/local/bin/protonvpn c IS-DE#1
ExecStop=/usr/local/bin/protonvpn disconnect
Restart=always

[Install]
WantedBy=multi-user.target
EOF
