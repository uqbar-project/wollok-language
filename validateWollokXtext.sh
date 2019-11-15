# Script
# - builds Wollok core libraries
# - and runs sanity tests
# in Wollok Xtext environment
#
# 1.1
#
# You need to run this in the root folder of wollok-language
# which should have wollok (xtext implementation) as parent folder
# 
DEV_MODE=$1

if [ -z "$WOLLOK_DEV_ROOT" ];
then
  BASE_WOLLOK_DEV_ROOT=../
else
  BASE_WOLLOK_DEV_ROOT=WOLLOK_DEV_ROOT
fi

rm -rf .history/ && cd src && WOLLOK_DEV_ROOT=$BASE_WOLLOK_DEV_ROOT/.. wollok build && cd .. && WOLLOK_DEV_ROOT=$BASE_WOLLOK_DEV_ROOT wollok test -dontValidate
