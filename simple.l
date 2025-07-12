%{
#include "y.tab.h"
%}

%%
"if"              { return IF; }
"else"            { return ELSE; }
"while"           { return WHILE; }
"input"           { return INPUT; }
"print"           { return PRINT; }
"/"               { return DIV; }
"=="              { return EQ; }
"<"               { return LT; }
">"               { return GT; }
"<="              { return LE; }
">="              { return GE; }
"!="              { return NE; }
"="               { return ASSIGN; }
"("               { return LPAREN; }
")"               { return RPAREN; }
";"               { return SEMI; }
[0-9]+(\.[0-9]+)? { yylval.fval = atof(yytext); return NUMBER; }
[a-zA-Z][a-zA-Z0-9]* { yylval.sval = strdup(yytext); return IDENTIFIER; }
[\t\n]+           { /* Skip whitespace */ }
.                 { printf("Unknown character: %s\n", yytext); }
%%