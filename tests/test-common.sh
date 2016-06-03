# Generate u2 file from pre-u2_test9.json

# GeoIP configuration

PYJSONU2="/usr/bin/pyjsonu2.py"
BARNYARD2="../src/barnyard2"
PYCHECKJSON="/usr/bin/checkjson.py"

# Params:
#  $1 => configuration
#  $2 => u2 template
#  $3 => out json check template
function test() {
  TMP_DIR=$(mktemp -d)
  B2_CONFIG=${TMP_DIR}/config.conf
  JSON_U2_SRC=$2
  U2_LOG=${TMP_DIR}/snort.log
  JSON_OUT=${TMP_DIR}/out.json
  JSON_CHECK_TEMPLATE=$3
  BARNYARD2_LOG=${TMP_DIR}

  cp $1 $B2_CONFIG
  sed -i "s%TMP_DIR%${TMP_DIR}%g" $B2_CONFIG
  echo "Pyjsonu2"
  python $PYJSONU2 $JSON_U2_SRC $U2_LOG
  echo "Barnyard"
  $BARNYARD2 -c $B2_CONFIG -o $U2_LOG -l $BARNYARD2_LOG
  echo "Pycheck"
  python $PYCHECKJSON -t $JSON_CHECK_TEMPLATE -j $JSON_OUT
}

