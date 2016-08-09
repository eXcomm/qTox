FROM dockcross/windows-x86
MAINTAINER Iphigenia Df "iphydf@gmail.com"

RUN cd /usr/src/mxe \
&& make -j12 \
   ffmpeg \
   gtk2 \
   libsodium \
   openal \
   qtbase \
   qtsvg \
   qttools \
&& make clean-junk clean-pkg

RUN curl https://fukuchi.org/works/qrencode/qrencode-3.4.4.tar.gz | tar zx \
&& cd qrencode-3.4.4 \
&& ./configure \
     --prefix=/usr/src/mxe/usr/i686-w64-mingw32.static \
     --host=i686-w64-mingw32.static \
     --enable-static \
     --disable-shared \
     --disable-thread-safety \
&& make && make install \
&& cd .. && rm -rf qrencode-3.4.4*

RUN apt-get install -y tcl

RUN git clone --depth=1 --branch=v3.3.1 https://github.com/sqlcipher/sqlcipher \
&& cd sqlcipher \
&& sed -i -e 's/SQLITE_OS_UNIX=1/SQLITE_OS_WIN=1/' configure \
&& sed -i -e 's/install:\tsqlcipher\$(BEXE)/install:/' Makefile.in \
&& sed -i -e 's/\$(LTINSTALL) sqlcipher\$(BEXE)/#&/' Makefile.in \
&& ./configure \
     --prefix=/usr/src/mxe/usr/i686-w64-mingw32.static \
     --host=i686-w64-mingw32.static \
     --enable-static \
     --disable-shared \
     --disable-tcl \
     --disable-amalgamation \
     --with-crypto-lib=none \
&& make && make install \
&& cd .. && rm -rf sqlcipher

ENV DEFAULT_DOCKCROSS_IMAGE iphydf/windows-x86-qt5
