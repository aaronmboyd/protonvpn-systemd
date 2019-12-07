# protonvpn-systemd
Connection service for ProtonVPN using a `systemd` process.

# Dependencies
* ProtonVPN account and user credentials
* Install the ProtonVPN-CLI - https://protonvpn.com/support/linux-vpn-tool/
* Superuser rights to create systemd service

# Instructions

## Create service
[Download and execute the shell script](https://github.com/aaronmboyd/protonvpn-systemd/blob/master/create_protonvpn_service.sh) - (you may need to `chmod +x` first to be able to execute)

## Reload systemd catalog
```
sudo systemctl daemon-reload
```
## Enable and start the service
```
sudo systemctl enable protonvpn.service
sudo systemctl start protonvpn.service
```
## Troubleshooting

*View the service logs*
```
sudo systemctl status protonvpn.service
```
*Or*
```
sudo journalctl -xe
```


