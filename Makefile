all: survey.pdf

SRC = $(wildcard *.tex)

# Hacky target; added survey.tex just so it's the first one, even though SRC
# has survey.tex.
survey.pdf: survey.tex $(SRC)
	pdflatex $<
	bibtex $(basename $< .tex)
	pdflatex $<
	pdflatex $<
