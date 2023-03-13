

%option nounput
%option noinput


    // Global variable to keep track of the current line number
    int line_count = 1;


        // Declaration of the ERROR_STATE
%x ERROR_STATE

%%

\n                        { line_count++; }  // Count the number of lines

"//".*        ;  // Ignore comments

[ \t]+        ;  // Ignore spaces and tabs



"forall"			    printf("RESERVED WORD: %s\n", yytext);
"exists"			    printf("RESERVED WORD: %s\n", yytext);
[x-z][0-9]              printf("VARIABLE: %s\n", yytext);
[a-c][0-9]              printf("CONSTANT: %s\n", yytext);
[P-T][0-9]              printf("PREDICATE: %s\n", yytext);
[f-g][0-9]              printf("FUNCTION: %s\n", yytext);
!                       printf("NEGATION: %s\n", yytext);
"&"                     printf("CONJUNCTION: %s\n", yytext);
"|"                     printf("DISJUNCTION: %s\n", yytext);
"< - >"                 printf("DOUBLE IMPLICATION: %s\n", yytext);
"- >"                   printf("IMPLICATION: %s\n", yytext);
"("                     printf("LEFT PARENTHESIS: %s\n", yytext);
")"                     printf("RIGHT PARENTHESIS: %s\n", yytext);
","                     printf("COMMA: %s\n", yytext);

[x-z][0-9]+                { // Error: Variable has length greater than 1
                          // Encountered an error, enter the ERROR_STATE
                          yymore();
                          BEGIN(ERROR_STATE);
                        }
[a-c][0-9]+                { // Error: Variable has length greater than 1
                          // Encountered an error, enter the ERROR_STATE
                          yymore();
                          BEGIN(ERROR_STATE);
                        }
[P-T][0-9]+                { // Error: Variable has length greater than 1
                          // Encountered an error, enter the ERROR_STATE
                          yymore();
                          BEGIN(ERROR_STATE);
                        }
[f-g][0-9]+                { // Error: Variable has length greater than 1
                          // Encountered an error, enter the ERROR_STATE
                          yymore();
                          BEGIN(ERROR_STATE);
                        }


.           {  // Rule for handling errors

                  // Encountered an error, enter the ERROR_STATE
                  yymore();
                  BEGIN(ERROR_STATE);
            }


<ERROR_STATE>\n       ;{
                          // Print the invalid expression and quit the error state

                          int len = yyleng - 1;
                          int count = line_count;
                          if(yytext[len] == '\n'){line_count++;}
                          yytext[len]='\0';
                          BEGIN(0);
                          printf("Error at line %d caused by '%c': invalid expression '%s'\n", count, yytext[0], yytext);


                       }

<ERROR_STATE>.              {yymore();}


%%

extern FILE *yyin;

int main( int argc, char *argv[] ){

    if ( argc < 2 ) {
        printf("usage: %s <file>\n", argv[0] );
        return EXIT_FAILURE;
    }

    yyin = fopen( argv[ 1 ], "r" );

    yylex();

    return EXIT_SUCCESS;
}
