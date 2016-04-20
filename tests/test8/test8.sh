# Generate u2 file from pre-u2_test8.json
# Check http parameter conf.

HOME_PYJSONU2="/home/devel/pyjsonu2"
HOME_BARNYARD2="/home/devel/barnyard2"


#sudo rm /tmp/barnyard2-test8

python $HOME_PYJSONU2/src/u2hexa.py test8/pre-u2_test8.json test8/tmp/post-u2-test8.u2

# Generate a json file by barnyard2
# /tmp/kafka_messages-test8

sudo $HOME_BARNYARD2/src/barnyard2 -c $HOME_BARNYARD2/tests/test8/barnyard2-test8.conf -o $HOME_BARNYARD2/tests/test8/tmp/post-u2-test8.u2

if [ $? -ne 0 ]; then
exit 0
else 
exit 1
fi
