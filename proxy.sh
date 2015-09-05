#!/bin/bash
### ./proxy.sh somehost 
### now all of your web traffic is forwared via SSH through somehost


disable_proxy()
{
sudo networksetup -setsocksfirewallproxystate Wi-Fi off
#        networksetup -setsocksfirewallproxystate Ethernet off
 echo "SOCKS proxy disabled."
}
trap disable_proxy INT
 
sudo networksetup -setsocksfirewallproxy Wi-Fi 127.0.0.1 9999
sudo networksetup -setsocksfirewallproxystate Wi-Fi on
#networksetup -setsocksfirewallproxy Ethernet 127.0.0.1 9999
#networksetup -setsocksfirewallproxystate Ethernet on

echo "SOCKS proxy enabled."
echo "Tunneling..."
ssh -ND 9999 $1
