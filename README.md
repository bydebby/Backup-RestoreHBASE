# backup-restorehbase
How To Backup Hbase

Run script-hbaseddl.sh
  [test@worker ~]$ nohup bash -x script_hbaseddl.sh &
 
Backup file hdfs hbase -> nohup hadoop fs -get 'directory hdfs hbase' 'directory local &
Example:
  [test@worker ~]$ nohup hadoop fs -get /apps/hbase /home/test/apps/ &

Checking file nohup.out running
  [test@worker ~]$ jobs
  [1]+ 11129 Running                 nohup bash -x script_hbaseddl.sh &
  
  or
  
  [test@worker ~]$ tail -f nohup.out
  
  or
  
  [test@worker ~]$ ps -xw
  PID TTY      STAT   TIME COMMAND
  17997 ?        S      0:01 sshd: test@pts/0
  17998 pts/0    Ss     0:04 -bash
  11129 ?        S      0:05 bash -x script_hbaseddl.sh
  47850 pts/0    R+     0:00 ps -xw
  
Finding out the file nohup.out running in directory (who use this file)
  [test@worker ~]$ lsof | grep nohup.out
  
Kill jobs
  [test@worker ~]$ kill %1
  
  or 
  
  [test@worker ~]$ kill -9 NumberPID
