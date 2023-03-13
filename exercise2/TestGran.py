import math, sys
import polynOperations as operations

def inverse(ply1, ply2, modulo):
	table=[[""],[ply1,ply2],[[1],[0]],[[0],[1]]]
	i=0
	r=1
	while len(table[1][-1])>0:
		print("Division: "+str(table[1][i])+"/"+str(table[1][i+1]))
		division=operations.polyn_division(table[1][i], table[1][i+1], modulo)
		q=division[0]
		table[0].append(q)
		
		r=division[1]
		table[1].append(r)
		print("Residue: "+str(r))
		
		s=operations.polyn_substraction(table[2][i], operations.polyn_multi(q, table[2][i+1], modulo), modulo)
		table[2].append(s)
		print("S: "+str(s))
		
		t=operations.polyn_substraction(table[3][i], operations.polyn_multi(q, table[3][i+1], modulo), modulo)
		table[3].append(t)
		print("T: "+str(t)+"\n")
		
		
		i+=1
	return(table[2][-2])
	

if __name__ == "__main__":
	table=inverse([1, 0, 3, 0, 0, 0, 3, 1], [4, 1, 1, 1], modulo)
	print(table)
	#print("Quotient: "+str(table[0]))
	#print("Table: "+str(table[1]))
	#print("GCD: "+str(table[1][-2]))
	#print("Inverse/s: "+str(table[2]))
	#print("t: "+str(table[3]))
	#print("Steps: "+str(i))
