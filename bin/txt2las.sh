#!/bin/sh

__dir=$(dirname $(realpath "$0"))
cmd="${__dir}/txt2las64 $@"
$(bash -c "$cmd")
