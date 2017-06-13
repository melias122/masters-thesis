FILE=dp1
BUILD_DIR=.build

all:
	latexmk -pdf -ps- -dvi- -time -output-directory=$(BUILD_DIR) $(FILE).tex
	cp $(BUILD_DIR)/$(FILE).pdf .
