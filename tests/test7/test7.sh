# Generate u2 file from pre-u2_test7.json
# Check correct parameter "enrich_wih" without close }.

HOME_PYJSONU2="/home/devel/pyjsonu2"
HOME_BARNYARD2="/home/devel/barnyard2"


sudo rm /tmp/barnyard2-test7

python $HOME_PYJSONU2/src/u2hexa.py test7/pre-u2_test7.json test7/tmp/post-u2-test7.u2

# Generate a json file by barnyard2
# /tmp/kafka_messages-test7

sudo $HOME_BARNYARD2/src/barnyard2 -c $HOME_BARNYARD2/tests/test7/barnyard2-test7.conf -o $HOME_BARNYARD2/tests/test7/tmp/post-u2-test7.u2

if [ $? -ne 0 ]; then
exit 0
else 
exit 1
fi
