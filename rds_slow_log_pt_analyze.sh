#!/bin/bash
#date=$(date +%Y%m%d)
path="/home/PT"
echo -en "\n Available Instances - \n\n"
info=$(/usr/local/bin/aws rds describe-db-instances | jq ' .DBInstances[] | select( .Engine ) | .DBInstanceIdentifier + ": " + .DBInstanceStatus' | awk '{ print $1, $2 }' | sed 's/\"//g' | sed 's/,//g' | sed 's/://g' | nl )

echo "$info"
echo -en "\n";read -p "Enter Instance Name : " instance

if [[ $(echo "$info" | grep -sw "$instance" | wc -l) -eq 1 ]]; then
 rds_node=$(echo "$info" | grep -sw "$instance" | awk '{print $2}');
else
 echo "Instance not found";
 exit;
fi

echo -en "\nAvailable Slow Logs For : $rds_node \n\n"
log_files=`/usr/local/bin/aws rds describe-db-log-files --db-instance-identifier $rds_node | grep slowquery | awk '{ print $2 }' | sed 's/\"//g' | sed 's/,//g' | sort -V`
if [[ $(echo "$log_files" | wc -c) -gt 1 ]]; then
 echo "$log_files"
else
 echo -en "\nno Slow Log Files .. exiting the script [script]\n"
 exit
fi

echo -en "\n";read -p "Enter Slow Log File : " log_file
/usr/local/bin/aws rds download-db-log-file-portion --db-instance-identifier $rds_node --log-file-name $log_file --output text > $path/rds_slow_query.log

if [[ -f /usr/bin/pt-query-digest || -f /bin/pt-query-digest ]]; then
pt-query-digest --limit=95% --set-vars='ssl_verify_mode='SSL_VERIFY_NONE'' $path/rds_slow_query.log > $path/slow_pt_result.log
echo -en "\n\nStatus ... [done] \n\nOutput File - $path/slow_pt_result.log\n\nThank You\n"
else
echo "pt-query-digest not found [exit]\n"
fi
exit
