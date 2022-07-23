%{

#include<stdio.h>

#define IDENTIFIER 1  //Identifier token
#define ERROR 2  //Error token

%}

letter    [a-zA-Z]
number 	  [0-9]
point      "."
op        [-|+|*|/|^|=|_|#]
at        "@"

%option noyywrap

%%

({letter}|{op}|{number})+({at})({letter})+({point})({letter})+  return IDENTIFIER;

(.)*                                   return ERROR;

%%

int main(){

	printf("Ingrese correo electrónico\n");

	int token = yylex();
	
	if(token==IDENTIFIER){
    	printf("Correo aceptado\n");
	}
	else if(token==ERROR)
    	printf("Correo no aceptado\n");
  return 1;
}