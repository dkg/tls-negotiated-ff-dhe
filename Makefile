TITLE = tls-negotiated-dl-dh
OUTPUTS = $(TITLE).txt $(TITLE).nroff $(TITLE).html

all: $(OUTPUTS)

$(TITLE).txt: $(TITLE).xml
	DISPLAY= xml2rfc $(TITLE).xml --text

$(TITLE).nroff: $(TITLE).xml
	DISPLAY= xml2rfc $(TITLE).xml --nroff

$(TITLE).html: $(TITLE).xml
	DISPLAY= xml2rfc $(TITLE).xml --html

view-html: $(TITLE).html
	sensible-browser file://`pwd`/$(TITLE).html

view-nroff: $(TITLE).nroff
	man ./$(TITLE).nroff

# this probably only works for dkg:
publish-html: $(TITLE).html
	scp $(TITLE).html lair:public_html/$(TITLE)/index.html

clean:
	rm -f $(OUTPUTS)

.PHONY: all view-html view-nroff clean publish-html
