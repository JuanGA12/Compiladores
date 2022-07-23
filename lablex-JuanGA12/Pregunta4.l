%{
	#include<stdio.h>
%}

KEYWORD while|if|else|int
IDENTIFIER [a-zA-Z]
INT_CONSTANT [0-9]
OPERATOR [+-/*=!><]
SPECIAL_SYMBOL [{}();]

%option noyywrap
%%

[ \n\t] ;
{KEYWORD} printf("(\"%s\", KEYWORD) \n",yytext);
{IDENTIFIER}+ printf("(\"%s\", IDENTIFIER)\n",yytext);
{INT_CONSTANT}+   printf("(\"%s\", INT_CONSTANT)\n",yytext);
{OPERATOR} printf("(\"%s\", OPERATOR)\n",yytext);
{SPECIAL_SYMBOL} printf("(\"%s\", SPECIAL_SYMBOL)\n",yytext);

%%
int main(){
	yylex();
}

