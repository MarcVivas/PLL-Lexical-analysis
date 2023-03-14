%option nounput
%option noinput

    #include <stdbool.h>

    // Global variable to keep track of the current line number
    float keywords = 0;
    float ids = 0;
    float operators = 0;
    float whitespace = 0;
    float comments = 0;
    float separators = 0;
    float constants = 0;
    float auxiliars = 0;
    int total = 0;


%%

(False|class|from|or|None|continue|global|pass|True|def|if|raise|and|del|import|return|as|elif|in|try|assert|else|is|while|async|except|lambda|with|await|finally|nonlocal|yield|break|for|not)	{ total+=1; keywords+=1;}

[a-zA-Z]+[a-zA-Z0-9_]*	        {total+=1; ids+=1;}

([+\-(\*\*?)(\/\/?)%&=\|\!<>\^]?=)|(\+)|\-|\*|%|\*\*|\/\/|>>=|<<=|and|or|not|is|in|&|\||^|~|<<|>>|<|>	        { total+=1; operators+=1;}

[ \t\n\v\r\f]        { total+=1; whitespace+=1;}

\(|\)|\[|\]|\{|\}|\.|\,|\:|\;|\@	{total+=1; separators+=1;}

[0-9]*\.?[0-9]*|\"[^\"]*\"|\'[^\']*\'	{total+=1; constants+=1;}


"#".*        { total+=1; comments+=1;}


.           { total+=1; auxiliars+=1;}


%%

extern FILE *yyin;

int main( int argc, char *argv[] ){

    if ( argc < 2 ) {
        printf("usage: %s <file>\n", argv[0] );
        return EXIT_FAILURE;
    }

    yyin = fopen( argv[ 1 ], "r" );

    yylex();   
    printf("Reservat: %f%%", (keywords/total)*100 );
    printf("\n");
    printf("Identificadors: %f%%", (ids/total)*100);
    printf("\n");
    printf("Operadors: %f%%", (operators/total)*100);
    printf("\n");
    printf("Espais en blanc: %f%%", (whitespace/total)*100);
    printf("\n");
    printf("Comentaris: %f%%", (comments/total)*100);
    printf("\n");
    printf("Separadors: %f%%", (separators/total)*100);
    printf("\n");
    printf("Constants: %f%%", (constants/total)*100);
    printf("\n");
    printf("Auxiliars: %f%%", (auxiliars/total)*100);
    printf("\n");
    printf("Total: %d", total);
    printf("\n");

    return EXIT_SUCCESS;
}
