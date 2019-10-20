# WARNING: currently, the custom virtual switch cannot be used for Hyper-V VM, see README.md

# Create a new Hyper-V Virtual Switch
New-VMSwitch –SwitchName “VagrantNAT” –SwitchType Internal
# Configure the NAT Gateway IP Address
New-NetIPAddress –IPAddress 192.168.137.1 -PrefixLength 24 -InterfaceAlias "vEthernet (VagrantNAT)"
# Configure the NAT rule
New-NetNat –Name VagrantNATnetwork –InternalIPInterfaceAddressPrefix 192.168.137.0/24
# Disable ipv6
Disable-NetAdapterBinding -Name "vEthernet (VagrantNAT)" -ComponentID ms_tcpip6 -PassThru