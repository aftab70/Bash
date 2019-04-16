mysql -h 10.10.10.12 -P 3306 -u haproxy_root -p123456 BOOKS -e 'INSERT INTO AUTHOR (name) VALUES("AFTAB");'


mysqlslap --user=haproxy_root --password=123456 --host=10.10.10.12 --verbose --concurrency=1000 --iterations=100 --create-schema=BOOKS --query='INSERT INTO AUTHOR (name) VALUES ("AFTAB");'
