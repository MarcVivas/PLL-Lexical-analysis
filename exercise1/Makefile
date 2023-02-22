all : numbers

numbers : 	numbers.l
				lex numbers.l
				gcc -Wall lex.yy.c -o numbers -ll

clean :
	rm -f lex.yy.c numbers