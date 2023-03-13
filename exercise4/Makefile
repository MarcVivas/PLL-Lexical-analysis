all :  cp1

cp1 : 	 cp1.l
				lex  cp1.l
				gcc -Wall lex.yy.c -o  cp1 -ll

clean :
	rm -f lex.yy.c  cp1