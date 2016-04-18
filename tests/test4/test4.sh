# Generate u2 file from pre-u2_test4.json

# Extra_data: EVENT_INFO_FILE_SHA256, EVENT_INFO_FILE_SIZE, EVENT_INFO_FILE_NAME,
#             EVENT_INFO_FILE_HOSTNAME, EVENT_INFO_FILE_MAILFROM,
#             EVENT_INFO_FILE_RCPTTO, EVENT_INFO_FILE_EMAIL_HDRS,
#             EVENT_INFO_SMB_UID, EVENT_INFO_SMB_IS_UPLOAD,
#             Without EVENT_INFO_FTP_USER

HOME_PYJSONU2="/home/devel/pyjsonu2"
HOME_BARNYARD2="/home/devel/barnyard2"
HOME_PYCHECKJSON="/home/devel/pycheckjson"

pwd
mkdir test4/tmp

sudo rm /tmp/barnyard2-test4

python $HOME_PYJSONU2/src/u2hexa.py test4/pre-u2_test4.json test4/tmp/post-u2-test4.u2

# Generate a json file by barnyard2
# /tmp/kafka_messages-test4

sudo $HOME_BARNYARD2/src/barnyard2 -c $HOME_BARNYARD2/tests/test4/barnyard2-test4.conf -o $HOME_BARNYARD2/tests/test4/tmp/post-u2-test4.u2

sudo cp /tmp/barnyard2-test4 test4/tmp/

# Check elements json file.

sudo python $HOME_PYCHECKJSON/src/checkjson.py -t $HOME_BARNYARD2/tests/test4/template_test4.json -j $HOME_BARNYARD2/tests/test4/tmp/barnyard2-test4

#sudo rm /tmp/barnyard2-test4
#rm -rf test4/tmp
