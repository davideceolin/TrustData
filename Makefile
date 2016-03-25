BUILD = build
LATEX = latex
FIGS = figs
# Substitute prname with your proposal's acronym.
PRNAME = IWSM-Mensura-2016
PDF = $(BUILD)/$(PRNAME).pdf

.SUFFIXES:.md .tex .pdf

.PHONY: all prepare

all: $(PDF)
	rm -f $(PRNAME).pdf
	ln -s $(PDF) $(PRNAME).pdf

$(BUILD):
	mkdir build

prepare: $(BUILD) $(MDTEX)
	cp $(LATEX)/*.tex build
	cp $(LATEX)/*.cls build
	cp $(LATEX)/*.bib build
	cp $(FIGS)/* build

$(PDF): prepare
	cd $(BUILD) && \
	pdflatex $(PRNAME).tex && \
	bibtex $(PRNAME) && \
	pdflatex $(PRNAME).tex && \
	pdflatex $(PRNAME).tex 

clean:
	-rm -r build
	-find . -type f -name .DS_Store |xargs rm
	-find . -type f |grep "~$$"|xargs rm
	-rm $(PRNAMEg).pdf
