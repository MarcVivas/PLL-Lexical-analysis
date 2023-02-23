all : cp0

cp0 : 	cp0.l
				lex cp0.l
				gcc -Wall lex.yy.c -o cp0 -ll

clean :
	rm -f lex.yy.c cp0
