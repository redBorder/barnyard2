# Generate u2 file from pre-u2_test1.json

HOME_PYJSONU2="/home/devel/pyjsonu2"
HOME_BARNYARD2="/home/devel/barnyard2"
HOME_PYCHECKJSON="/home/devel/pycheckjson"

mkdir test1/tmp

sudo rm /tmp/barnyard2-test1

python $HOME_PYJSONU2/src/u2hexa.py test1/pre-u2_test1.json test1/tmp/post-u2-test1.u2

# Generate a json file by barnyard2
# /tmp/kafka_messages-test1

sudo $HOME_BARNYARD2/src/barnyard2 -c $HOME_BARNYARD2/tests/test1/barnyard2-test1.conf -o $HOME_BARNYARD2/tests/test1/tmp/post-u2-test1.u2

sudo cp /tmp/barnyard2-test1 test1/tmp/

# Check elements in the json file.

sudo python $HOME_PYCHECKJSON/src/checkjson.py -t $HOME_BARNYARD2/tests/test1/template_test1.json -j $HOME_BARNYARD2/tests/test1/tmp/barnyard2-test1

sudo rm /tmp/barnyard2-test1
rm -rf test1/tmp
