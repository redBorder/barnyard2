# Generate u2 file from pre-u2_test6.json
# Check correct parameter "enrich_wih" without first {.

HOME_PYJSONU2="/home/devel/pyjsonu2"
HOME_BARNYARD2="/home/devel/barnyard2"


#sudo rm /tmp/barnyard2-test6

python $HOME_PYJSONU2/src/u2hexa.py test6/pre-u2_test6.json test6/tmp/post-u2-test6.u2

# Generate a json file by barnyard2
# /tmp/kafka_messages-test6

sudo $HOME_BARNYARD2/src/barnyard2 -c $HOME_BARNYARD2/tests/test6/barnyard2-test6.conf -o $HOME_BARNYARD2/tests/test6/tmp/post-u2-test6.u2

if [ $? -ne 0 ]; then
exit 0
else 
exit 1
fi
