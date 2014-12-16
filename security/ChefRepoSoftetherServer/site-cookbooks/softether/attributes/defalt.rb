## repository

if kernel['machine'] =~ /x86_64/
  default['softether']['site_url'] = 'http://jp.softether-download.com/files/softether/v4.06-9437-beta-2014.04.09-tree/Linux/SoftEther%20VPN%20Server/64bit%20-%20Intel%20x64%20or%20AMD64/softether-vpnserver-v4.06-9437-beta-2014.04.09-linux-x64-64bit.tar.gz'
  default['softether']['arch_file'] = 'softether-vpnserver-v4.06-9437-beta-2014.04.09-linux-x64-64bit.tar.gz'
else
  default['softether']['site_url'] = 'http://jp.softether-download.com/files/softether/v4.06-9437-beta-2014.04.09-tree/Linux/SoftEther%20VPN%20Server/32bit%20-%20Intel%20x86/'
  default['softether']['arch_file'] = 'softether-vpnserver-v4.06-9437-beta-2014.04.09-linux-x86-32bit.tar.gz'
end

## for tempolary working
default['softether']['working_dir'] = ::File.join(Chef::Config[:file_cache_path], 'softether')
default['softether']['configure_flags'] = ' --prefix=/opt/local --with-openssl'
