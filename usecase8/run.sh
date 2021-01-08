#!/usr/bin/env bash


su - gpadmin
/code/usecase8/pxf/setupDB.sh
ls -al /home/gpadmin/pxf/templates
mkdir /home/gpadmin/pxf/servers/minioserver
cp  /home/gpadmin/pxf/templates/minio-site.xml /home/gpadmin/pxf/servers/minioserver/
cd /code/usecase8/pxf/conf
./setupMinioConfig.sh
cd /usr/local/greenplum-db/pxf/bin
pxf stop
pxf start
./setupDB.sh
psql -U gpadmin -d pxf_db -c "\dE"
psql -U gpadmin -d pxf_db -c "select * from pxf_minio_stocks;"



