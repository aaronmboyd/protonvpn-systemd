sudo tee -a /etc/systemd/system/protonvpn.service <<EOF
[Unit]
Description=ProtonVPN CLI Auto-Start
After=network.target

[Service]
Type=forking
User=root
ExecStart=protonvpn c IS-DE#1 || protonvpn c IS-NL#1 || protonvpn c IS-IL#1
ExecReload=protonvpn disconnect && protonvpn c IS-DE#1 || protonvpn c IS-NL#1 || protonvpn c IS-IL#1
ExecStop=protonvpn disconnect
Restart=always
KillMode=mixed
EOF
