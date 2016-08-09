#!/bin/sh

RUN() {
  "$@"
}
export CMAKE=cmake
export MAKE=make

export PKG_CONFIG_PATH=/opt/ffmpeg/lib/pkgconfig
