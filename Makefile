all: survey.pdf

%.pdf: %.tex
	pdflatex $<
