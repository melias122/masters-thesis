FILE = diplomovka
BUILD_DIR = .

LATEXMK_OPTIONS = -pdf -synctex=1 -output-directory=$(BUILD_DIR) -interaction="nonstopmode" --shell-escape
LINE_WIDTH = error_line=240 half_error_line=160 max_print_line=240

all: pdf #clean

pdf:
	./plotgen.sh
	inkscape -D -z --file=img/ga.svg --export-pdf=ga.pdf --export-latex
	inkscape -D -z --file=img/pga.svg --export-pdf=pga.pdf --export-latex
	$(LINE_WIDTH) latexmk $(LATEXMK_OPTIONS) $(FILE).tex
#	cp -u $(BUILD_DIR)/$(FILE).pdf .

clean:
	git clean -f
#	rm -fr $(FILE).pdf

rebuild: clean pdf

open:
	xdg-open $(FILE).pdf

.PHONY: all pdf clean rebuild open
