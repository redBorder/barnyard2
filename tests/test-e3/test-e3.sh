# Generate u2 file from pre-u2_test-e3.json

# Extra_data: EVENT_INFO_FILE_SHA256, EVENT_INFO_FILE_SIZE, EVENT_INFO_FILE_NAME,
#             EVENT_INFO_FILE_HOSTNAME, EVENT_INFO_FILE_MAILFROM,
#             EVENT_INFO_FILE_RCPTTO, EVENT_INFO_FILE_EMAIL_HDRS,
#             EVENT_INFO_SMB_UID, EVENT_INFO_SMB_IS_UPLOAD,
#             Without EVENT_INFO_FTP_USER

. ./test-common.sh

test './test-e3/barnyard2-test-e3.conf' './test-e3/pre-u2_test-e3.json' './test-e3/template_test-e3.json'

if [ $? -ne 0 ]; then
exit 0
else
exit 1
fi
