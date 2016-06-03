# Generate u2 file from pre-u2_test9.json

# GeoIP configuration
. ./test-common.sh

test './test9/barnyard2-test9.conf' './test9/pre-u2_test9.json' './test9/template_test9.json'
#return $?


if [ $? -ne 0 ]; then
exit 1 
else
exit 0
fi


