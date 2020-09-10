# Generate_Analyze_RDS_Slow_Log_Reports
This Shell script is belongs to Generate a RDS Slow Logs and analyze the SQL Queries

Environment is AWS - RDS and Aurora 

############################################################################################
# Automation Script for Reading Amazon RDS MySQL / Aurora Slow_log file's from terminal    #
############################################################################################

Amazon Relational Database Service (RDS) is providing the cloud based database service. It is the cost-efficient, resize able & ease to manage. As in any other DBaaS, If you need to analyse the log files (Error log / Slow log), we need to login the console and manually download the files. 

Logging into the console seems simple, But this is a bit complex operation when it comes to incorporate that in a day to day operation and automation. This document process for downloading the log files directly from command line without console GUI.

####################
#  Prerequisites   #
####################

Following tools are to be installed for this operation. 

(1) awscli – Cli utility for AWS Cloud 
(2) jq – Utility For Parse And Format JSON Data, Just like SED for JSON

Script File is -  rds_slow_log_pt.sh 


#######################
#   Sample Output     #
#######################

[root@hostname]# ./rds_slow_log_pt.sh 

Available Instances - 

     1	database1 available
     2	database2 available
     3	database3 available
     4	database4 available
     5	database5 available
     6	database6 available
     7	database7 available

Enter Instance Name : database3

Available Slow Logs For : database3

slowquery/mysql-slowquery.log
slowquery/mysql-slowquery.log.2020-06-08.10
slowquery/mysql-slowquery.log.2020-06-08.11
slowquery/mysql-slowquery.log.2020-06-08.12
slowquery/mysql-slowquery.log.2020-06-08.13
slowquery/mysql-slowquery.log.2020-06-08.14
slowquery/mysql-slowquery.log.2020-06-08.15
slowquery/mysql-slowquery.log.2020-06-08.16
slowquery/mysql-slowquery.log.2020-06-08.17
slowquery/mysql-slowquery.log.2020-06-08.18
slowquery/mysql-slowquery.log.2020-06-08.19
slowquery/mysql-slowquery.log.2020-06-08.20
slowquery/mysql-slowquery.log.2020-06-08.21
slowquery/mysql-slowquery.log.2020-06-08.22
slowquery/mysql-slowquery.log.2020-06-08.23
slowquery/mysql-slowquery.log.2020-06-09.00
slowquery/mysql-slowquery.log.2020-06-09.01
slowquery/mysql-slowquery.log.2020-06-09.02
slowquery/mysql-slowquery.log.2020-06-09.03
slowquery/mysql-slowquery.log.2020-06-09.04
slowquery/mysql-slowquery.log.2020-06-09.05
slowquery/mysql-slowquery.log.2020-06-09.06
slowquery/mysql-slowquery.log.2020-06-09.07
slowquery/mysql-slowquery.log.2020-06-09.08
slowquery/mysql-slowquery.log.2020-06-09.09

Enter Slow Log File : slowquery/mysql-slowquery.log.2020-06-08.12
Status ... [done] 

Output File - /home/PT/slow_pt_result.log

Thank you
