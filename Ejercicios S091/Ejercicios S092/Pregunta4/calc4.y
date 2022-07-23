%{
    #include <stdio.h>
    #include <ctype.h>
%}
%token NUMBER
%left '*'
%left '+' '-'

%%
command : exp {printf("%d\n", $1);}
;
exp :  NUMBER {$$ = $1;}
    | exp '+' exp {$$ = $1 + $3;}
    | exp '-' exp {$$ = $1 - $3;}
    | exp '*' exp {$$ = $1 * $3;}
    | '(' exp ')' {$$ = $2;}
    ;

%%

main()
{ return yyparse();
}
int  yylex(void)
{
    int c;
    while ((c = getchar()) == ' '); 
        if (isdigit(c)){
        ungetc(c, stdin);
        scanf("%d", &yylval);
        return(NUMBER);
    }
    if (c == '\n') return 0;
    return (c);
}
void yyerror(char* s)
{ fprintf(stderr, "%s\n", s);
}