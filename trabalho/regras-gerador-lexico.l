digit[0-9]
letter[a-zA-Z]
ID[a-zA-Z][a-zA-Z0-9]*
WHITESPACE[ ]
quebra[\n]
aspas["]
TAB[\t]

%{
    #define YY_DECL extern "C" int yylex()
    #include<string.h>
    #include<stdio.h>
    #include<iostream>
    using namespace std;
    FILE *out ;
	int linha;
%}
%option yylineno
%x COMMENT

%%

{quebra}

"/*" { linha=yylineno; BEGIN(COMMENT); }

<COMMENT>"*/" { BEGIN(INITIAL); }

<COMMENT>(.|\n);

<COMMENT><<EOF>> {fprintf(out,"(%d,ERROR,\"/*\")\n",linha); return 0;}

#include|"stdio.h"|scanf|printf|else|if|int|float|return|void|while|main {fprintf(out,"(%d, Palavras Chaves, \"%s\")\n",yylineno ,yytext);} 

{aspas}|"%.2f"|"&"|"'"|"%f"|"+"|"-"|"*"|"/"|"<"|"<="|">"|">="|"=="|"!="|"="|";"|","|"("|")"|"["|"]"|"{"|"}" {fprintf(out,"(%d, Simbolos, \"%s\")\n",yylineno,yytext);}

{WHITESPACE}+|{quebra}|{TAB}+ 

{aspas}+{letter}+{aspas} {fprintf(out,"(%d, Aspas, \"%s\")\n",yylineno,yytext);}
 
{digit}+ {fprintf(out,"(%d, Numero, \"%s\")\n",yylineno,yytext);}

{digit}+{ID}+ {fprintf(out,"(%d, ERROR, \"%s\")\n",yylineno,yytext); return 0;}

{ID}+ {fprintf(out,"(%d, Reservados, \"%s\")\n",yylineno,yytext);}

. {fprintf(out,"(%d,ERROR,\"%s\")\n",yylineno,yytext); return 0;}

%%

int yywrap();

int main(int argc, char *argv[]){
    FILE *arquivo = fopen(argv[1],"r");
    if (!arquivo) {
      cout << "Arquivo inexistente" << endl;
      return -1;
    }
    yyin = arquivo;
    out = fopen(argv[2],"w");
    yylex();
    return 0;
}

int yywrap(){
    return 1;
}