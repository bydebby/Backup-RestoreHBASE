# BACKUP HBASE
How To Backup Hbase

Run script-hbaseddl.sh
  [test@worker ~]$ nohup bash -x script_hbaseddl.sh &
 
Backup file hdfs hbase -> nohup hadoop fs -get 'directory hdfs hbase' 'directory local &
Example:
  [test@worker ~]$ nohup hadoop fs -get /apps/hbase /home/test/apps/ &
  
# RESTORE HBASE
How to Restore Data Hbase
  [test@worker ~]$ hbase shell
  hbase(main):001:0> create 'namatabelhbase',{{NAME => 'fam_namatabelhbase', VERSIONS => '1', EVICT_BLOCKS_ON_CLOSE => 'false', NEW_VERSION_BEHAVIOR => 'false',     KEEP_DELETED_CELLS => 'FALSE', CACHE_DATA_ON_WRITE => 'false', DATA_BLOCK_ENCODING => 'NONE', TTL => 'FOREVER', MIN_VERSIONS => '0', REPLICATION_SCOPE => '0', BLOOMFILTER => 'ROW', CACHE_INDEX_ON_WRITE => 'false', IN_MEMORY => 'false', CACHE_BLOOMS_ON_WRITE => 'false', PREFETCH_BLOCKS_ON_OPEN => 'false', COMPRESSION => 'NONE', BLOCKCACHE => 'true', BLOCKSIZE => '65536'}
  
nohup hadoop fs -put direktori_lokal direktori_hdfs &
  [test@worker ~]$ nohup hadoop fs -put /home/test/apps/hbase/data/data/default/namatabelhbase /apps/hbase/data/archive/data/default/ &

Check list files
  [test@worker ~]$ hadoop fs -ls /apps/hbase/data/archive/data/default/namatabelhbase
  drwxr-xr-x   - btkdi hdfs          0 2022-03-08 16:49 /apps/hbase/data/archive/data/default/namatabelhbase/7a98e1d2e17438ffa096e9593710343d

Restore hdfs to hbase
  [test@worker ~]$ hbase org.apache.hadoop.hbase.mapreduce.LoadIncrementalHFiles /apps/hbase/data/archive/data/default/namatabelhbase/7a98e1d2e17438ffa096e9593710343d namatabelhbase

Check the result
  [test@worker ~]$ hbase shell
  hbase(main):001:0> count "namatabelhbase"
  40 row(s)
  Took 0.5918 seconds
  => 40

# CHECKING FILE NOHUP.OUT RUNNING

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
