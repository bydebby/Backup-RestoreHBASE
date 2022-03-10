#BackupHbaseDDL
  echo 'list' | hbase shell -n > /home/test/backup_hbase_ddl/list_table_hbase.dat
  cat /home/test/backup_hbase_ddl/list_table_hbase.dat | grep -v "TABLE" | grep -v "row(s)" | grep -v "seconds" | sort -u > /home/test/backup_hbase_ddl/list_table_hbase.dat.sort

  for i in `cat /home/test/backup_hbase_ddl/list_table_hbase.dat.sort | head -2`
    do j=`echo ${i} | sed 's/$/"/' | sed 's/^/"/'`
        echo 'describe' ${j} | hbase shell -n > /home/test/backup_hbase_ddl/ddl_file/${i}.ddl
  done
