#!/bin/sh

RUN() {
  "$@"
}
export CMAKE=cmake
export MAKE=make

export CMAKE_PREFIX_PATH=`brew --prefix qt5`
