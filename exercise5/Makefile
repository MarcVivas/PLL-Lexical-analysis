all : automata

automata : 	automata.l
				lex automata.l
				gcc -Wall lex.yy.c -o automata -ll

clean :
	rm -f lex.yy.c automata
