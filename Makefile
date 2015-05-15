all: survey.pdf

%.pdf: %.tex
	latexmk -pdf $< || pdflatex  $<
	$(RM) *.{aux,log,out,toc,fdb_latexmk,fls}

clean:
	$(RM) *.pdf



