#
# Makefile for both static and dynamic PF_RING user libraries
#
#

#
# Installation directory
#
INSTDIR   = /usr/local

#
# Search directories
#
INCLUDE   = -I../../kernel

#
# DNA
#
DNA_OBJS  = 

#
# Object files
#
OBJS      = pfring.o ${DNA_OBJS}

#
# C compiler and flags
#
#
# CROSS_COMPILE=arm-mv5sft-linux-gnueabi-
#
CC        = ${CROSS_COMPILE}gcc
CFLAGS    = -g  -Wall -fPIC ${INCLUDE}  
LDFLAGS   = -g -shared

SYSLIBS   = -lpthread 

# How to make an object file
%.o: %.c %.h
#	@echo "=*= making object $@ =*="
	${CC} ${CFLAGS} -c $< -o $@

#
# Main targets
#
STATICLIB  = libpfring.a
DYNAMICLIB = libpfring.so
TARGETS    = ${STATICLIB} ${DYNAMICLIB}

all: ${TARGETS}

${STATICLIB}: Makefile  ${OBJS} pfring.h ${RING_H}
	@echo "=*= making library $@ =*="
	ar rs $@ ${OBJS}
	ranlib $@

${DYNAMICLIB}: ${OBJS}  pfring.h Makefile
	@echo "=*= making library $@ =*="
	${CC} ${LDFLAGS} ${OBJS} ${SYSLIBS} -o $@

extract_dna_lib:
	ar x 

install: ${STATICLIB} ${DYNAMICLIB}
	mkdir -p ${DESTDIR}/lib
	mkdir -p ${DESTDIR}/include
	cp ${STATICLIB} ${DESTDIR}/lib/
	cp ${DYNAMICLIB} ${DESTDIR}/lib/

clean:
	@rm -f ${TARGETS} *.o *~
