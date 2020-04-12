
BASENAME=draft-sas-idr-maxprefix
EXT=.xml
VERSION=00
SOURCENAME=${BASENAME}${EXT}
DRAFTNAME=${BASENAME}-${VERSION}

all:
	if [ -d ${DRAFTNAME} ]; then \
	echo "Dir exists, not creating it"; \
	else mkdir ${DRAFTNAME}; \
	fi
	xml2rfc ${BASENAME}-outbound${EXT} -b ${DRAFTNAME} --raw --text --html
	xml2rfc ${BASENAME}-inbound${EXT} -b ${DRAFTNAME} --raw --text --html

text:
	xml2rfc ${BASENAME}-outbound${EXT} -b ${DRAFTNAME} --raw
	xml2rfc ${BASENAME}-inbound${EXT} -b ${DRAFTNAME} --raw

paginated:
	xml2rfc ${BASENAME}-outbound${EXT} -b ${DRAFTNAME} --text
	xml2rfc ${BASENAME}-inbound${EXT} -b ${DRAFTNAME} --text

html:
	xml2rfc ${BASENAME}-outbound${EXT} -b ${DRAFTNAME} --html
	xml2rfc ${BASENAME}-inbound${EXT} -b ${DRAFTNAME} --html

clean:
	rm -fr ${DRAFTNAME}
