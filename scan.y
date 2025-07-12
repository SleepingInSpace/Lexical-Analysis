%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);

%}

%token HELLO WORLD

%%
input: /* empty */
    | input line
    ;

line: HELLO WORLD '\n' {
        printf("Hello World recognized!\n");
    }
    | '\n'  // To handle empty lines gracefully
    ;

%%

int main() {
    printf("Enter 'hello world':\n");
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}