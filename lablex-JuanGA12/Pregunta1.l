%{

#include<stdio.h> 

int linea = 1 ;

%}

%option noyywrap

%%

.+\n {printf("Numero de linea: %d ||| Input: %s \n",linea,yytext); linea++;}

%%

int main(){

	yylex();

}
