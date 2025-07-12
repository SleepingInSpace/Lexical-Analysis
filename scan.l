%{
#include "y.tab.h"
%}

%%
hello   { return HELLO; }
world   { return WORLD; }
[ \t]+  { /* Ignore whitespace */ }
\n      { return '\n'; }  // End of input
.       { /* Ignore other characters */ }
%%

int yywrap() {
    return 1;
}