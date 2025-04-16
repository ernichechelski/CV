LATEX := xelatex
OUT := output/pdf

.PHONY: all clean

all: $(OUT)/CV.pdf

$(OUT)/CV.pdf: CV.tex assets/portrait.jpg
	mkdir -p $(OUT) tmp/latex
	$(LATEX) -interaction=nonstopmode -halt-on-error -output-directory=tmp/latex CV.tex
	$(LATEX) -interaction=nonstopmode -halt-on-error -output-directory=tmp/latex CV.tex
	cp tmp/latex/CV.pdf $(OUT)/CV.pdf

clean:
	rm -rf tmp/latex $(OUT)/CV.pdf
