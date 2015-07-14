CC = GCC

SOURCES =  xdelta3-blkcache.h \
		   xdelta3-cfgs.h \
		   xdelta3-decode.h \
		   xdelta3-djw.h \
		   xdelta3-fgk.h \
		   xdelta3-hash.h \
		   xdelta3-internal.h \
		   xdelta3-list.h \
		   xdelta3-lzma.h \
		   xdelta3-main.h \
		   xdelta3-merge.h \
		   xdelta3-second.h \
		   xdelta3-test.h \
		   xdelta3.h \
		   xdelta3.c

TARGETS = xdelta3-i686 \
		  xdelta3-x86_64

CFLAGS= -Wall -Wshadow -fno-builtin -O3
XDWINFLAGS:=-DXD3_STDIO=0 -DXD3_POSIX=0 -DXD3_WIN32=1 -DEXTERNAL_COMPRESSION=0 \
			-DREGRESSION_TEST=1 -DSHELL_TESTS=0 -DXD3_DEBUG=0 \
			-DSECONDARY_DJW=1 -DSECONDARY_FGK=1 \
			-DXD3_MAIN=1 -DXD3_USE_LARGEFILE64=1

LZMACOMMON = -DSECONDARY_LZMA=1 -Iliblzma/include -llzma
LZMA32 = $(LZMACOMMON) -Lliblzma/lib/i486
LZMA64 = $(LZMACOMMON) -Lliblzma/lib/x86-64


xdelta3-i686: $(SOURCES)
			  $(CC) $(CFLAGS) xdelta3.c -lm -o xdelta3-i686.exe \
					$(LZMA32) \
					$(XDWINFLAGS)


xdelta3-x86_64: $(SOURCES)
				$(CC) $(CFLAGS) xdelta3.c -lm -o xdelta3-x86_64 \
					  $(LZMA64) \
					  $(XDWINFLAGS)
