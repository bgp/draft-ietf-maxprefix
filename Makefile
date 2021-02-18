
BASENAME=draft-sas-idr-maxprefix
EXT=.xml
VERSION=03
SOURCENAME=${BASENAME}${EXT}
DRAFTNAME=${BASENAME}-${VERSION}

all:
	if [ -d ${DRAFTNAME} ]; then \
	echo "Dir exists, not creating it"; \
	else mkdir ${DRAFTNAME}; \
	fi
	xml2rfc ${BASENAME}-outbound${EXT} -b ${DRAFTNAME} --text --html
	xml2rfc ${BASENAME}-inbound${EXT} -b ${DRAFTNAME} --text --html

paginated:
	xml2rfc ${BASENAME}-outbound${EXT} -b ${DRAFTNAME} --text
	xml2rfc ${BASENAME}-inbound${EXT} -b ${DRAFTNAME} --text

html:
	xml2rfc ${BASENAME}-outbound${EXT} -b ${DRAFTNAME} --html
	xml2rfc ${BASENAME}-inbound${EXT} -b ${DRAFTNAME} --html

clean:
	rm -fr ${DRAFTNAME}
