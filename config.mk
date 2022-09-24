VERSION		= 0.0.1

PREFIX		= /usr/local

LIBDIR		= lib
BIN				= keycli
CFLAGS		= -Wall -MD
SRCDIR		= src
BUILDDIR 	= build
CC				= cc
INCLUDE		= include

CFLAGS 		+= -I$(INCLUDE)

ifeq (${BUILD_MODE}, dev)
CFLAGS		+= -Og -g -DDEBUG_MODE
PRJ_PATH 	= "."
else
CFLAGS		+= -Os
endif

CFLAGS		+= -DVERSION=\"${VERSION}\"

# termbox2 lib dependancy
TBLIB			= libtermbox.a
TBDIR			:= $(LIBDIR)/termbox2
TBARC			:= $(TBDIR)/$(TBLIB)
CFLAGS 		+= -I$(TBDIR)


# library archives
LIBARC 		:= $(TBARC)
