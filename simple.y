%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

extern int yylex();
void yyerror(const char *s);
%}

%union {
    float fval;
    char *sval;
}

%token <sval> IDENTIFIER
%token <fval> NUMBER
%token IF ELSE WHILE INPUT PRINT
%token DIV EQ LT GT LE GE NE ASSIGN LPAREN RPAREN SEMI

%%
program:
    statement
    ;

statement:
    expression SEMI
    | control_statement
    | loop_statement
    | io_statement
    ;

control_statement:
    IF LPAREN condition RPAREN LBRACE program RBRACE
    | IF LPAREN condition RPAREN LBRACE program RBRACE ELSE LBRACE program RBRACE
    ;

loop_statement:
    WHILE LPAREN condition RPAREN LBRACE program RBRACE
    ;

io_statement:
    PRINT LPAREN expression RPAREN SEMI
    | IDENTIFIER ASSIGN INPUT LPAREN RPAREN SEMI
    ;

expression:
    IDENTIFIER ASSIGN expression
    | NUMBER DIV NUMBER
    | IDENTIFIER DIV NUMBER
    | NUMBER DIV IDENTIFIER
    | IDENTIFIER DIV IDENTIFIER
    ;

condition:
    expression EQ expression
    | expression LT expression
    | expression GT expression
    | expression LE expression
    | expression GE expression
    | expression NE expression
    ;

%%
void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}
int main() {
    return yyparse();
}