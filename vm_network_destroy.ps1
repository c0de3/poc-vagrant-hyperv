# WARNING: currently, the custom virtual switch cannot be used for Hyper-V VM, see README.md

# Remove the Hyper-V Virtual Switch
Remove-NetNat –Name VagrantNATnetwork
Remove-VMSwitch –SwitchName “VagrantNAT”
Remove-NetIPAddress -IPAddress 192.168.137.1