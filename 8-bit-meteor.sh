SYS_TYPE=`uname -m`

if [ ${SYS_TYPE} == 'x86_64' ]; then
  . './bin/8-bit-meteor64.sh'
else
  . './bin/8-bit-meteor32.sh'
fi