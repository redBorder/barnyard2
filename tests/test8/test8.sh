# Generate u2 file from pre-u2_test8.json
# Check http parameter conf.

. ./test-common.sh

test './test8/barnyard2-test8.conf' './test8/pre-u2_test8.json' './test8/template_test8.json'

if [ $? -ne 0 ]; then
exit 0
else 
exit 1
fi
