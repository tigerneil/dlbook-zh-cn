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

#IMAGEDEPS := $(wildcard graphics/*.tex)
#IMAGEDEPS += $(wildcard graphics/*.png)
#IMAGEDEPS += $(wildcard graphics/*.jpeg)

CONTENTS := $(wildcard contents/*.tex)

.PHONY: all graphics

all: $(TARGET)
#all: graphics $(TARGET)

$(TARGET): $(SOURCES) $(IMAGEDEPS) $(CONTENTS) dlbook.bib
	$(TEX) $(basename $@)
	$(MKBIB) $(basename $@)
	$(MKIDX) $(basename $@)
	$(MKGLS) $(basename $@)
	$(TEX) $(basename $@)	# compile twice to make sure the toc is generated
	$(TEX) $(basename $@) # compile 3 times to make sure index/bibliography/glossary files are generated

graphics:
	$(MAKE) -C graphics

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
