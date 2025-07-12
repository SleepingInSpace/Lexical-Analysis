%{
#include "y.tab.h"
%}

%%
[0-9]+           { yylval.fval = atof(yytext); return NUMBER; }
"+"              { return ADD; }
"-"              { return SUB; }
[ \t\n]          ; // Ignore whitespace
.                { printf("Unknown character: %s\n", yytext); }

%%

int yywrap() {
    return 1;
}