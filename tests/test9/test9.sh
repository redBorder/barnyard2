# Generate u2 file from pre-u2_test9.json

# GeoIP configuration

HOME_PYJSONU2="/home/devel/pyjsonu2"
HOME_BARNYARD2="/home/devel/barnyard2"
HOME_PYCHECKJSON="/home/devel/pycheckjson"

mkdir test9/tmp

sudo rm /tmp/barnyard2-test9

python $HOME_PYJSONU2/src/u2hexa.py test9/pre-u2_test9.json test9/tmp/post-u2-test9.u2

# Generate a json file by barnyard2
# /tmp/kafka_messages-test9

sudo $HOME_BARNYARD2/src/barnyard2 -c $HOME_BARNYARD2/tests/test9/barnyard2-test9.conf -o $HOME_BARNYARD2/tests/test9/tmp/post-u2-test9.u2

if [ $? -ne 0 ]; then
exit 1
else 
exit 0
fi


