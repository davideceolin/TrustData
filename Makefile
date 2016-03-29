FIGS = figs
PRNAME = IWSM-Mensura-2016
PDF = $(PRNAME).pdf

.SUFFIXES:.tex .pdf .bib .eps

.PHONY: all

all: $(PDF)

$(PDF): *.tex
	pdflatex $(PRNAME).tex && \
	bibtex $(PRNAME) && \
	pdflatex $(PRNAME).tex && \
	pdflatex $(PRNAME).tex 

clean:
	-find . -type f -name .DS_Store |xargs rm
	-find . -type f |grep "~$$"|xargs rm
	-rm $(PRNAMEg).pdf
