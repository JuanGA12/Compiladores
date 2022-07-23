all:	
	yacc -d calc7.y
	lex calc7.l
	gcc lex.yy.c y.tab.c -ll -ly -o exec

clean:
	rm lex.yy.c
	rm y.tab.c
	rm y.tab.h
	rm exec
