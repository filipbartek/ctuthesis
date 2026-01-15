bartefil.pdf: bartefil.tex bartefil.bib ctuthesis.cls preamble.tex glossary.tex introduction.tex results.tex publications.tex
	pdflatex -shell-escape bartefil
	bibtex bartefil
	pdflatex -shell-escape bartefil
	pdflatex -shell-escape bartefil

publications-main.pdf: publications-main.tex bartefil.bib glossary.tex
	pdflatex -shell-escape publications-main
	bibtex publications-main
	pdflatex -shell-escape publications-main

