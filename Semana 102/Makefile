all:	
	yacc -d calc11.y
	lex calc11.l
	gcc lex.yy.c y.tab.c -ll -ly -o exec

clean:
	rm lex.yy.c
	rm y.tab.c
	rm y.tab.h
	rm exec
