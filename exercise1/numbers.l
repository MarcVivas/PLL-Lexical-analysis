

%option nounput
%option noinput

    #include <stdbool.h>

    // Global variable to keep track of the current line number
    int line_count = 1;

    
        // Declaration of the ERROR_STATE
%x ERROR_STATE


%%

\n                        { line_count++; }  // Count the number of lines

[ \t]+        ;  // Ignore spaces and tabs


"//".*        ;  // Ignore comments


("b"|"B")[0-1]+           { printf("%ld\n", strtol(yytext+1, NULL, 2)); }   // Convert Binary to decimal


("o"|"O")[0-7]+           { printf("%ld\n", strtol(yytext+1, NULL, 8)); }  // Convert Octal to decimal


("ox"|"OX")[0-9A-F]+      { printf("%ld\n", strtol(yytext+2, NULL, 16)); }  // Convert Hex to decimal


[0-9]*                    { printf("%ld\n", strtol(yytext, NULL, 10)); }  // Convert Decimal to Decimal



.           {  // Rule for handling errors

                  // Encountered an error, enter the ERROR_STATE
                  yymore();
                  BEGIN(ERROR_STATE);
            }


<ERROR_STATE>[ \t\n]       ;{
                              // Print the invalid expression and quit the error state

                              int len = yyleng - 1;
                              if(yytext[len] == '\n'){line_count++;}
                              yytext[len]='\0';
                              BEGIN(0);
                              printf("Error at line %d: invalid expression '%s'\n", line_count, yytext);
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
