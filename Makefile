# Makefile
#

TEX = xelatex
MKIDX = makeindex
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

$(TARGET): $(SOURCES) $(IMAGEDEPS) $(CONTENTS)
	$(TEX) $(basename $@)
	$(MKIDX) $(basename $@)
	$(MKGLS) $(basename $@)
	$(TEX) $(basename $@)	# compile twice to make sure the toc is generated
	#$(TEX) $(basename $@) # compile 3 times to make sure index is generated

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
