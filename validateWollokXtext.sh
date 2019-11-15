# Validate Wollok Xtext
#
# 1.0
#
# You need to run this in the root folder
# 
# TODO: detect if WOLLOK_DEV_ROOT is already present
rm -rf .history/ && cd src && WOLLOK_DEV_ROOT=../.. wollok build && cd .. && WOLLOK_DEV_ROOT=../ wollok test -dontValidate
