%{
    #include <stdio.h>
    #include <ctype.h>
    void yyerror(const char* s);
    static int yylex();
    extern int yyparse();
    extern FILE* yyin;
    #define YYSTYPE double
%}
%token NUMBER
%left '*'
%left '+' '-'
%%
command : exp {printf("%f\n", $1);}
;
exp : exp '+' term {$$ = $1 + $3;}
    | exp '-' term {$$ = $1 - $3;}
    | term {$$ = $1;}
    ;
term : term '*' factor {$$ = $1 * $3;}
     | factor {$$ = $1;}
     ;
factor : NUMBER {$$ = $1;}
       | '(' exp ')' {$$ = $2;}
       ;
%%
int main()
{ return yyparse();
}
static int  yylex(void)
{
    int c;
    while ((c = getchar()) == ' ');
    if (isdigit(c)){
        ungetc(c, stdin);
        scanf("%lf", &yylval);
        return(NUMBER);
    }
    if (c == '\n') return 0;
    return (c);
}
void yyerror(const char* s){ 
    fprintf(stderr, "%s\n", s);
}
	