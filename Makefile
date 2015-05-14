all: final.pdf

%.pdf: %.tex
	pdflatex $<
