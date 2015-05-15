all: survey.pdf

SRC = $(wildcard *.tex)

%.pdf: %.tex
	latexmk -pdf $<
	$(RM) *.{aux,log,out,toc,fdb_latexmk,fls}

clean:
	$(RM) *.pdf
	$(RM) *.{aux,log,out,toc,fdb_latexmk,fls}



achal: survey.tex $(SRC)
	pdflatex $<
	bibtex $(basename $< .tex)
	pdflatex $<
	pdflatex $<

.PHONY: achal
