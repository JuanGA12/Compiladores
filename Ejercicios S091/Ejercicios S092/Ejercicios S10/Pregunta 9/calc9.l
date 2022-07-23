%option noyywrap
%{
#include <stdio.h>
#define YY_DECL int yylex()
#include "y.tab.h"
%}
number  [0-9]+.?|[0-9]*.[0-9]+
endline [.*\n]
%%
[ ] {}
{number} {return NUMBER;}
\n|.     {return yytext[0];}
%%
void yyerror(char *s) {
fprintf(stderr, "%s\n", s); 
}