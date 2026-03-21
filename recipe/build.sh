#!/usr/bin/env bash

set -o xtrace -o nounset -o pipefail -o errexit

if [[ ${target_platform} =~ .*osx.* ]]; then
    export LDFLAGS="${LDFLAGS} -lintl"
fi

cmake -B build -S . -DCMAKE_POLICY_VERSION_MINIMUM=3.5 ${CMAKE_ARGS} -G Ninja
cmake --build build
cmake --install build
