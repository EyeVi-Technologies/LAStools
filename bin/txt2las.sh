#!/bin/sh

__dir=$(dirname $(realpath "$0"))
cmd="${__dir}/txt2las $@"
$(bash -c "$cmd")
