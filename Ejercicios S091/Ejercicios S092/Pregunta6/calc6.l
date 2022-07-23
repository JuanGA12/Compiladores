%option noyywrap
%{
#include <stdio.h>

#define YY_DECL int yylex()

#include "y.tab.h"

%}


%%

[ ] {}
[0-9]+\.[0-9]+ 	{yylval = atof(yytext); return NUMBER;}
[0-9]+		{yylval = atoi(yytext); return NUMBER;}
\n|. {return yytext[0];}
%%