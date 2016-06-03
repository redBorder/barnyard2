# Generate u2 file from pre-u2_test2.json

. ./test-common.sh

test './test2/barnyard2-test2.conf' './test2/pre-u2_test2.json' './test2/template_test2.json'

#return $?
if [ $? -ne 0 ]; then
exit 0
else
exit 1
fi
