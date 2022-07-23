%{
	#include<stdio.h>
	int N_LINEAS = 1;
	int N_PALABRAS = 0;
	int N_CARACTERES = 0;
%}

%option noyywrap
%%

[^ \t\n]+ {N_PALABRAS++; N_CARACTERES += yyleng;}
 \n {N_LINEAS++;}

%%

int main(){
	yylex();
	printf("Numero de lineas: %d\n", N_LINEAS);
	printf("Numero de palabras: %d\n", N_PALABRAS);
	printf("Numero de caracteres: %d\n", N_CARACTERES);
}

