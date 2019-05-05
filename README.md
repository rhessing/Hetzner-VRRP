# Hetzner_keepalived - keepalived for hetzner cloud
Example on how to use Keepalived VRRP within the Hetzner cloud

## Requirements

 - Vswitch
 - 2 Cloud VPS with keepalived installed
 - 2 Floating IPs
 - 1 Valid API Token
   - Hetzner Cloud -> Access -> API Tokens

## Configuration
Use the keepalived.conf as an example on how to configure keepalived, please check the file and adjust accordingly (ID, IP's)

Please note that the keepalived.conf displayed in this repo is the one used on the second server (FIN-LB02), you 
will need to figure out the correct configuration file for the first server (just flip the contents in the MASTER/BACKUP vrrp instances)

## VIP.sh
A basic script without any checks whatsoever being called using:
`/usr/local/bin/vip.sh HEL-LB01 VIP-HEL-LB01`

The script has two arguments:
- HEL-LB01 = server name
- VIP-HEL-LB01 = description for the floating IP

Please make sure that you use he exact same server names and VIP descriptions in the hetzner cloud admin interface and when calling the script within keepalived.

Also, add your own token in the script, see requirements ;-)

This setup has been tested and confirmed to be working for at least 3 months at hetzner without issues (there were server issues but the other node always took over all traffic).

The switch will take up to 1 minute, this is a hetzner thingy and as far as I was aware cannot be done quicker.
