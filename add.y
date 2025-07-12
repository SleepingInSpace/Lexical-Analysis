%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

%union {
    float fval;
}

%token <fval> NUMBER
%token ADD SUB

%type <fval> expression

%%

program:
    expression { printf("Result: %.2f\n", $1); }
    ;

expression:
    expression ADD expression { $$ = $1 + $3; }
    | expression SUB expression { $$ = $1 - $3; }
    | NUMBER { $$ = $1; }
    ;

%%

int main() {
    printf("Enter an arithmetic expression:\n");
    return yyparse();
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}