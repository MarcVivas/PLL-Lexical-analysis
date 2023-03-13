all : test

test : 	test.l
				lex test.l
				gcc -Wall lex.yy.c -o test -ll

clean :
	rm -f lex.yy.c test
