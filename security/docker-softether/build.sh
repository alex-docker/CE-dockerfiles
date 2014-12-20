

[ ! -f src/softether-vpnbridge-v4.12-9514-beta-2014.11.17-linux-x64-64bit.tar.gz ] && wget http://www.softether-download.com/files/softether/v4.12-9514-beta-2014.11.17-tree/Linux/SoftEther_VPN_Bridge/64bit_-_Intel_x64_or_AMD64/softether-vpnbridge-v4.12-9514-beta-2014.11.17-linux-x64-64bit.tar.gz

[ ! -f src/softether-vpnclient-v4.12-9514-beta-2014.11.17-linux-x64-64bit.tar.gz ] && wget http://www.softether-download.com/files/softether/v4.12-9514-beta-2014.11.17-tree/Linux/SoftEther_VPN_Client/64bit_-_Intel_x64_or_AMD64/softether-vpnclient-v4.12-9514-beta-2014.11.17-linux-x64-64bit.tar.gz

[ ! -f src/softether-vpnserver-v4.12-9514-beta-2014.11.17-linux-x64-64bit.tar.gz ] && wget http://www.softether-download.com/files/softether/v4.12-9514-beta-2014.11.17-tree/Linux/SoftEther_VPN_Server/64bit_-_Intel_x64_or_AMD64/softether-vpnserver-v4.12-9514-beta-2014.11.17-linux-x64-64bit.tar.gz

docker build -t clouderg/vpn .
