#!/bin/sh

RUN() {
  ./dockcross "$@"
}
export CMAKE=i686-w64-mingw32.static-cmake
export MAKE=make
