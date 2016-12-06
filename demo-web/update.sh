sh stop
rm -rf temp/*
rm -rf work/*
cd webapps
tar -xzvf purms-web.tar.gz
bin/start.sh