#########################################################################
# vim: ts=8 sw=8
#########################################################################
# Author:   tf135c (James Reynolds)
# Filename: Makefile
# Date:     2006-12-28 07:52:03
#########################################################################
# Note that we use '::' rules to allow multiple rule sets for the same
# target.  Read that as "modularity exemplarized".
#########################################################################

TARGETS	=all clean distclean clobber check install uninstall tags
TARGET	=all

SUBDIRS	=

.PHONY:	${TARGETS} ${SUBDIRS}

.SUFFIXES: .rtf .pdf .html .xml

XMLTO	=xmlto

%.html:	%.xml
	${XMLTO} html-nochunks $<

%.pdf:	%.xml
	${XMLTO} pdf $<

%.rtf:	%.xml
	${XMLTO} rtf $<

XMLFILES=64-bit.xml lfs.xml
HTMLFILES=${XMLFILES:.xml=.html}
PDFFILES=${XMLFILES:.xml=.pdf}
RTFFILES=${XMLFILES:.xml=.rtf}

all::	${HTMLFILES} ${PDFFILES} ${RTFFILES}

${TARGETS}::

distclean clobber:: clean
	${RM} ${HTMLFILES} ${PDFFILES} ${RTFFILES}

# ${TARGETS}::
# 	${MAKE} TARGET=$@ ${SUBDIRS}

# ${SUBDIRS}::
# 	${MAKE} -C $@ ${TARGET}
