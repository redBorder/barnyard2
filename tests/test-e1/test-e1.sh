# Generate u2 file from pre-u2_test-e1.json

# Extra_data: EVENT_INFO_FILE_SHA256, EVENT_INFO_FILE_SIZE, EVENT_INFO_FILE_NAME,
#             EVENT_INFO_FILE_HOSTNAME, EVENT_INFO_FILE_MAILFROM,
#             EVENT_INFO_FILE_RCPTTO, EVENT_INFO_FILE_EMAIL_HDRS,
#             EVENT_INFO_SMB_UID, EVENT_INFO_SMB_IS_UPLOAD,
#             Without EVENT_INFO_FTP_USER

HOME_PYJSONU2="/home/devel/pyjsonu2"
HOME_BARNYARD2="/home/devel/barnyard2"
HOME_PYCHECKJSON="/home/devel/pycheckjson"

pwd
mkdir test-e1/tmp

sudo rm /tmp/barnyard2-test-e1

python2.7 $HOME_PYJSONU2/src/u2hexa.py test-e1/pre-u2_test-e1.json test-e1/tmp/post-u2-test-e1.u2

# Generate a json file by barnyard2
# /tmp/kafka_messages-test-e1

sudo $HOME_BARNYARD2/src/barnyard2 -c $HOME_BARNYARD2/tests/test-e1/barnyard2-test-e1.conf -o $HOME_BARNYARD2/tests/test-e1/tmp/post-u2-test-e1.u2

sudo cp /tmp/barnyard2-test-e1 test-e1/tmp/

# Check elements json file.

python2.7 $HOME_PYCHECKJSON/src/checkjson.py -t $HOME_BARNYARD2/tests/test-e1/template_test-e1.json -j $HOME_BARNYARD2/tests/test-e1/tmp/barnyard2-test-e1

#sudo rm /tmp/barnyard2-test-e1
#rm -rf test-e1/tmp
