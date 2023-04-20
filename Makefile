TEX = 'lualatex'
BIB = 'biber'

all: Presentation.pdf Handout.pdf ../Presentation.pdf ../Handout.pdf

clean:
	-rm Presentation.pdf Handout.pdf
	-rm tmp/*

Presentation: Presentation.pdf

Handout: Handout.pdf

../Presentation.pdf: Presentation.pdf
	cp Presentation.pdf ..

../Handout.pdf: Handout.pdf
	cp Handout.pdf ..

Presentation.pdf: Presentation.tex Talk.tex macros.tex metadata.tex
	$(TEX) Presentation
	-mv Presentation.aux tmp/
	-mv Presentation.log tmp/
	-mv Presentation.nav tmp/
	-mv Presentation.snm tmp/
	-mv Presentation.toc tmp/
	-mv Presentation.*.vrb tmp/
	-mv Presentation.out.ps tmp/

Handout.pdf: Handout.tex Talk.tex macros.tex metadata.tex
	$(TEX) Handout
	-mv Handout.aux tmp/
	-mv Handout.log tmp/
	-mv Handout.nav tmp/
	-mv Handout.snm tmp/
	-mv Handout.toc tmp/
	-mv Handout.*.vrb tmp/
	-mv Handout.out.ps tmp/
