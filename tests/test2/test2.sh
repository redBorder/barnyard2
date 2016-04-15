# Generate u2 file from pre-u2_test2.json

# Extra_data: file_size and sha256 file

HOME_PYJSONU2="/home/devel/pyjsonu2"
HOME_BARNYARD2="/home/devel/barnyard2"
HOME_PYCHECKJSON="/home/devel/pycheckjson"

pwd
mkdir test2/tmp

sudo rm /tmp/barnyard2-test2

python $HOME_PYJSONU2/src/u2hexa.py test2/pre-u2_test2.json test2/tmp/post-u2-test2.u2

# Generate a json file by barnyard2
# /tmp/kafka_messages-test2

sudo $HOME_BARNYARD2/src/barnyard2 -c $HOME_BARNYARD2/tests/test2/barnyard2-test2.conf -o $HOME_BARNYARD2/tests/test2/tmp/post-u2-test2.u2

# barnyard2 -c /opt/rb/etc/snort/0/barnyard2.conf -d /var/log/snort/0/instance-0 --event-cache-size 4096 -f snort.log

#sudo $HOME_BARNYARD2/src/barnyard2 -d $HOME_BARNYARD2/tests/test2/log --event-cache-size 4096 -f snort.log

# ok
# sudo $HOME_BARNYARD2/src/barnyard2 -c test2/barnyard2-test2.conf -d /var/log/snort/0/instance-0 --event-cache-size 4096 -f snort.log
#sudo $HOME_BARNYARD2/src/barnyard2 -c test2/barnyard2-test2.conf -d $HOME_BARNYARD2/tests/test2/tmp --event-cache-size 4096 -f post-u2-test2.u2

#/opt/rb/bin/barnyard2 -c test2/barnyard2-test2.conf -d /var/log/snort/0/instance-0 --event-cache-size 4096 -f snort.log

#sleep 30s
#sudo killall -9 barnyard2

sudo cp /tmp/barnyard2-test2 test2/tmp/

# Check elements json file.

sudo python $HOME_PYCHECKJSON/src/checkjson.py -t $HOME_BARNYARD2/tests/test2/template_test2.json -j $HOME_BARNYARD2/tests/test2/tmp/barnyard2-test2

#sudo rm /tmp/barnyard2-test2
#rm -rf test2/tmp
