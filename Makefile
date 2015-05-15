all: survey.pdf

SRC = $(wildcard *.tex)

clean:
	$(RM) *.pdf
	$(RM) *.{aux,log,out,toc,fdb_latexmk,fls}

# Hacky target; added survey.tex just so it's the first one, even though SRC
# has survey.tex.
survey.pdf: survey.tex $(SRC)
	latexmk -pdf $<
	$(RM) *.{aux,log,out,toc,fdb_latexmk,fls}
