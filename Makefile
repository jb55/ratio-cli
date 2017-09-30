
GEN=parser.tab.c parser.tab.h lex.yy.c

all: ratio

parser.tab.c parser.tab.h:	parser.y
	bison -d parser.y

lex.yy.c: lexer.l parser.tab.h
	flex lexer.l

ratio: $(GEN)
	$(CC) -o $@ -lgmp parser.tab.c lex.yy.c

clean:
	rm -f $(GEN)
