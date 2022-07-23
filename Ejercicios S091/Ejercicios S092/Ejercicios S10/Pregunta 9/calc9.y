%{
    #include <stdio.h>
    #include <ctype.h>
    void yyerror(const char* s);
    static int yylex();
    extern int yyparse();
    extern FILE* yyin;
%}
%token NUMBER
%%
command : exp {printf("%d\n", $1);}
;
exp : exp '+' term {$$ = $1 + $3;}
    | exp '-' term {$$ = $1 - $3;}
    | term {$$ = $1;}
    | error '+'
    | error '-'
    ;
term : term '*' factor {$$ = $1 * $3;}
     | factor {$$ = $1;}
     | error '*'
     ;
factor : NUMBER {$$ = $1;}
       | '(' exp ')' {$$ = $2;}
       | '(' error ')'
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
        scanf("%d", &yylval);
        return(NUMBER);
    }
    if (c == '\n') return NUMBER;
    return (c);
}
