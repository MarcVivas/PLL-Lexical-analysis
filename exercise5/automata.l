

%option nounput
%option noinput


    // Global variable to keep track of the current line number
    int line_count = 1;


        // Declaration of the ERROR_STATE
%x ERROR_STATE


%%

\n                        { line_count++; }  // Count the number of lines

"//".*        ;  // Ignore comments

[ \t,]+        ;  // Ignore spaces tabs and commas



"ALPHABET"              printf("Alphabet reserved word: %s\n", yytext);
"STATES"                printf("States reserved word: %s\n", yytext);
"TRANSITIONS"           printf("Transitions reserved word: %s\n", yytext);
\<"="                   printf("End of definition operator: %s\n", yytext);
"="\>                   printf("Start of definition operator: %s\n", yytext);

[a-z]                   printf("Alphabet symbol: %s\n", yytext);
"-"\>[a-z][0-9]+        printf("Inital state: %s\n", yytext);
[a-z][0-9]+"-"\>        printf("Final state: %s\n", yytext);
[a-z][0-9]+             printf("Intermidate state: %s\n", yytext);

"["                     printf("Left squared parenthesis: %s\n", yytext);
"]"                     printf("Right squared parenthesis: %s\n", yytext);
"..."                   printf("3 points: %s\n", yytext);
";"                     printf("Transtions separator: %s\n", yytext);


[a-z]+                { // Error: Alphabet symbol has length greater than 1
                          // Encountered an error, enter the ERROR_STATE
                          yymore();
                          BEGIN(ERROR_STATE);
                        }


.           {  // Rule for handling errors

                  // Encountered an error, enter the ERROR_STATE
                  yymore();
                  BEGIN(ERROR_STATE);
            }


<ERROR_STATE>["<="\n";"]       ;{
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
