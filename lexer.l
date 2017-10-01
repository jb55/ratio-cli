%option noyywrap

%{
#include <stdio.h>
#include <gmp.h>

#define YY_DECL int yylex()

#include "parser.tab.h"

%}

%%

[ \t]	; // ignore all whitespace
[0-9]+		{
  mpz_t i; mpz_init(i);
  mpq_init(yylval.rval);
  mpz_set_str(i, yytext, 10);
  mpq_set_z(yylval.rval, i);
  return T_RATIO;
}
\n		    {return T_NEWLINE;}
"+"		    {return T_PLUS;}
"-"		    {return T_MINUS;}
"*"		    {return T_MULTIPLY;}
"/"		    {return T_DIVIDE;}
"("		    {return T_LEFT;}
")"		    {return T_RIGHT;}

%%
