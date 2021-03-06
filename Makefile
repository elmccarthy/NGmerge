PREFIX=/usr/local
DESTDIR=
CC?=gcc
VERSION?=0.3
DISTNAME=NGmerge-${VERSION}
CFLAGS?=-fopenmp

NGmerge: NGmerge.c NGmerge.h
	$(CC) -g -Wall -std=gnu99 -O2 ${CFLAGS} -o NGmerge NGmerge.c -lz ${LDFLAGS}

install: NGmerge
	@mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp NGmerge $(DESTDIR)$(PREFIX)/bin

clean:
	-@rm NGmerge 2>/dev/null || true
	-@rm -rf ${DISTNAME}*

dist:
	rm -rf ${DISTNAME}*
	mkdir ${DISTNAME}
	cp -r `ls | grep -v ${DISTNAME}` ${DISTNAME}
	tar czvf ${DISTNAME}.tar.gz ${DISTNAME}
