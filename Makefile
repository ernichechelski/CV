LATEX := xelatex
OUT := output/pdf
DATA := generated/cv-data.tex

.PHONY: all clean

all: $(OUT)/CV.pdf

$(OUT)/CV.pdf: CV.tex assets/portrait.jpg $(DATA)
	mkdir -p $(OUT) tmp/latex
	$(LATEX) -interaction=nonstopmode -halt-on-error -output-directory=tmp/latex CV.tex
	$(LATEX) -interaction=nonstopmode -halt-on-error -output-directory=tmp/latex CV.tex
	cp tmp/latex/CV.pdf $(OUT)/CV.pdf

$(DATA): data/jobs.json scripts/generate_cv_data.py
	python3 scripts/generate_cv_data.py

clean:
	rm -rf tmp/latex $(OUT)/CV.pdf
