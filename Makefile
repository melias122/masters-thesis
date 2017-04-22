FILE = diplomovka
BUILD_DIR = .

LATEXMK_OPTIONS = -pdf -synctex=1 -output-directory=$(BUILD_DIR) -interaction=nonstopmode --shell-escape -silent
LINE_WIDTH = error_line=240 half_error_line=160 max_print_line=240

all: clean pdf

pdf:
	./plotgen.sh
	$(LINE_WIDTH) latexmk $(LATEXMK_OPTIONS) $(FILE).tex
#	cp -u $(BUILD_DIR)/$(FILE).pdf .

clean:
	git clean -f
	rm -fr $(FILE).pdf

refresh: clean pdf

.PHONY: all pdf clean refresh
