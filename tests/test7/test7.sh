# Generate u2 file from pre-u2_test7.json
# Check correct parameter "enrich_wih" without close }.

. ./test-common.sh

test './test7/barnyard2-test7.conf' './test7/pre-u2_test7.json' './test7/template_test7.json'
#Return $?


if [ $? -ne 0 ]; then
exit 0
else 
exit 1
fi
