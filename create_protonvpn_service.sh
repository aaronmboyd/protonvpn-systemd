sudo tee /etc/systemd/system/protonvpn.service <<EOF
[Unit]
Description=ProtonVPN CLI Auto-Start
After=network.target

[Service]
Type=forking
User=root
ExecStart=/usr/local/bin/protonvpn c IS-DE#1 || /usr/local/bin/protonvpn c IS-NL#1 || /usr/local/bin/protonvpn c IS-IL#1
ExecReload=/usr/local/bin/protonvpn disconnect && /usr/local/bin/protonvpn c IS-DE#1 || /usr/local/bin/protonvpn c IS-NL#1 || /usr/local/bin/protonvpn c IS-IL#1
ExecStop=/usr/local/bin/protonvpn disconnect
Restart=always
KillMode=mixed

[Install]
WantedBy=multi-user.target
EOF
