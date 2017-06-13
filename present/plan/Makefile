FILE=dp1
BUILD_DIR=.build

all:
	latexmk -pdf -ps- -dvi- -time -output-directory=$(BUILD_DIR) -silent $(FILE).tex
#	cp $(BUILD_DIR)/$(FILE).ps .
	cp $(BUILD_DIR)/$(FILE).pdf .
