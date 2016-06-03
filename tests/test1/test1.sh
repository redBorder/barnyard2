# Generate u2 file from pre-u2_test1.json

. ./test-common.sh

test './test1/barnyard2-test1.conf' './test1/pre-u2_test1.json' './test1/template_test1.json'
return $?
