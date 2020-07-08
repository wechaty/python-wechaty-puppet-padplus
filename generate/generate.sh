#!/usr/bin/env bash
set -e
shopt -s globstar

#
# Python Import Class With Same Name as Directory
#   https://stackoverflow.com/q/16245106/1123955
#

# Directory to write generated code to (.js and .d.ts files)
OUT_DIR="./src/padplus_grpc"
[ -d ${OUT_DIR} ] || {
  mkdir -p ${OUT_DIR}
}

PROTO_DIR="$OUT_DIR"

PROTOC_CMD="python -m grpc_tools.protoc --proto_path=./generate ./generate/pad_plus_server.proto"

$PROTOC_CMD \
  --python_betterproto_out=${OUT_DIR}

echo "" > ${OUT_DIR}/__init__.py
