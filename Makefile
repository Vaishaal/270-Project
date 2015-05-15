all: survey.pdf

SRC = $(wildcard *.tex)

%.pdf: %.tex
	latexmk -pdf $<
	$(RM) *.{aux,log,out,toc,fdb_latexmk,fls}

clean:
	$(RM) *.pdf



# Hacky target; added survey.tex just so it's the first one, even though SRC
# has survey.tex.
achal: survey.tex $(SRC)
	yes x | pdflatex $< || exit $?
	yes x | bibtex $(basename $< .tex) || exit $?
	yes x | pdflatex $< || exit $?
	yes x | pdflatex $< || exit $?

.PHONY: achal
