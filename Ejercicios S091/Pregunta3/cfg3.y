%{
#include <stdio.h>
#include <ctype.h>
extern int yylex(void);
void yyerror(char*);
%}

%token JUANCITO

%%

command : S { printf("%c\n", $1); }
        ;

S : A { $$ = $1; }
  | B { $$ = $1; }
  ;

A : JUANCITO { $$ = $1; }
  ;

B : JUANCITO { $$ = $1; }
  ;

%%

int main() {
    return yyparse();
}

int yylex() {
    int c;
    while ( (c = getchar()) == ' ' );

    if (c == 'a') {
        ungetc(c, stdin);
        scanf("%c", &yylval);
        return JUANCITO;
    }
    if (c == '\n') {
        return 0;
    }
    return c;
}

void yyerror(char* s) {
    fprintf(stderr, "yyerror: %s\n", s);
}
