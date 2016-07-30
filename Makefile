# Makefile
#

TEX = xelatex
MKIDX = makeindex
MKBIB = bibtex
MKGLS = makeglossaries
RM = rm -rf
MAKE = make
TARGET = dlbook.pdf
SOURCES := $(wildcard *.tex)
FIGURESDEPS := $(wildcard figures/*.eps)
FIGURESDEPS := $(wildcard figures/*.pdf)
FIGURESDEPS += $(wildcard figures/*.png)
FIGURESDEPS += $(wildcard figures/*.jpg)
CONTENTS := $(wildcard contents/*.tex)

.PHONY: all

all: $(TARGET)

$(TARGET): $(SOURCES) $(FIGURESDEPS) $(CONTENTS) dlbook-complete.bib
	$(TEX) $(basename $@)
	$(MKBIB) $(basename $@)
	$(MKIDX) $(basename $@)
	$(MKGLS) $(basename $@)
	$(TEX) $(basename $@)	# compile twice to make sure the toc is generated
	$(TEX) $(basename $@) # compile 3 times to make sure index/bibliography/glossary files are generated

clean:
	# $(MAKE) -C graphics clean
	$(RM) *.pdf
	$(RM) *.aux
	$(RM) *.log
	$(RM) *.out
	$(RM) *.toc
	$(RM) *.idx
	$(RM) *.ilg
	$(RM) *.ind
	$(RM) *.glg
	$(RM) *.glo
	$(RM) *.gls
	$(RM) *.xdy
	$(RM) *.bbl
	$(RM) *.blg
	$(RM) *.run.xml
	$(RM) *-blx.bib
