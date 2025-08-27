# target
TARGET = From_Calculus_to_Cohomology

# source
SRC_CHAPTER = chapters
TEX_SOURCE_FILES = $(shell find $(SRC_CHAPTER) -name '*.tex') \
				$(TARGET).tex \
				CustomBook.sty

# build
$(TARGET).pdf: $(TEX_SOURCE_FILES)
	pdflatex --shell-escape $(TARGET).tex
	biber $(TARGET)
	makeindex -s $(TARGET).ist $(TARGET).idx
	pdflatex $(TARGET).tex
	pdflatex $(TARGET).tex				

temp:
	pdflatex --shell-escape $(TARGET).tex

clean:
	latexmk -c

Clean:
	latexmk -C
	rm -f *.bbl *.gz