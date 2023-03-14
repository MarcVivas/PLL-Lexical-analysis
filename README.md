# PLL - Lexical analysis
22/02/2023
University of Lleida

## Authors
1. Pau Taló
2. Alexandre Pelegrina
3. Marc Vivas

## Table of Contents
1. [Authors](#authors)
2. [About this project](#introduction)
3. [Required libraries/packages](#required-libraries/packages)
4. [Exercise 1](#exercise-1)
5. [Exercise 2](#exercise-2)
6. [Exercise 3](#exercise-3)
7. [Exercise 4](#exercise-4)
8. [Exercise 5](#exercise-5)

## Introduction
The objective of this project is to use an automatic lexical analyzer generation tool to recognize different languages. The instructions to complete the project are located at `Statement.pdf`, they are written in Catalan.

## Required libraries/packages
You will need to install the next libraries (Ubuntu) if you want to run the programs:

Flex:
```bash
sudo apt-get install -y flex
```
Make:
```bash
sudo apt-get install -y make
```

## Exercise 1
The only thing to mention in this exercise are the comments. Comments can be added by starting the text with `//` and they will continue until a new line `\n` is encountered.
### Tests
There are 2 files titled `test.txt` and `test2.txt` that were used to test the exercise. The first file should throw errors and the second should not.

## Exercise 2
### Choosen language
The choosen language for this exercise is Python, due to our familiarity to it.

### Basic description
The program counts how many elements of each Python category exist on a specific file, and at the end shows the percentage of each and the total number of elements found
### Categories
For the keywords category, we simply used a list of all the Python keywords: False, class, from, or, None, continue, global, pass, True, def, if, raise, and, del, import, return, as, elif, in, try, assert, else, is, while, async, except, lambda, with, await, finally, nonlocal, yield, break, for, not

For the identifiers, we followed the identifier name rules for Python: any group of letters (capitals or not), numbers and underscore (\_), as long as the first character is a letter.

Just like with keywords, for whitespices we simply use a list

Once more, we use a full list for the separators.

For constants, on one hand we detect digit groups that can have a dot between them, which covers integers and floats. We also detect characters surrounded by "" or '', which covers both strings and character constants.

For comments, we simply detect lines starting with #.

Any other character is considered an auxiliar.

## Exercise 3
In this section, you will find a list of considerations that were taken into account while developing the solution for the exercise. The exercise has been implemented following the statement.
### Comments
Comments can be added by starting the text with `//` and they will continue until a new line `\n` is encountered.
### Variables
Varibales can only be words of length `1` with capital letters `[A-Z]`.
### Implications and double implications
The symbol `−` has been replaced for this character `-` which is typeable from the keyboard.
### Disjunctions
The symbol `∨` has been replaced for this character `|` which is typeable from the keyboard.
### Conjunctions
The symbol `∧` has been replaced for this character `&` which is typeable from the keyboard.
### Output
The program prints the encountered errors and also the tokens that are correct.
### Tests
There are 2 files titled `test.txt` and `test2.txt` that were used to test the exercise. The first file should throw errors and the second should not.
## Exercise 4
### Variables
The variables are a concatention of a range of characters (specified in the document) and a range of numbers between 0 and 9, so the new variables are like [x-z][0-9].
### Symbols
Similar to exercice 3, added extra symbol for the implication and double implication in a string and the reserved word forall and exists.
### Tests
There is a file titled `test.txt` with correct lines and incorrect lines.
## Exercise 5
The language described below defines a syntax for describing a finite automaton(deterministic and non-deterministic). It includes the definition of an alphabet, a set of states, and the transitions between those states based on the letters in the alphabet. The language allows for the designation of multiple initial states and one or more final states. The purpose of this language is to provide a way to specify a finite automaton and to implement a lexical analyzer that can identify the sequence of tokens in the input based on the defined automaton.


### Alphabet definition

Example:
```
ALPHABET => b, a, c, d, e, f <=
```
> The end of the definition is marked by `<=`.

#### ALPHABET
`ALPHABET` is a reserved word that is always followed by the operator `=>` to indicate the set of symbols of the automata's alphabet. In other programming languages `ALPHABET` can be seen as `String, int, char...`

#### Alphabet's symbols
Alphabet's symbols are used to define the set of valid inputs that an automata can accept. The symbols must be letters in lower case separated by commas.




### States definition
Example:
```
STATES => ->q0, q1, ->q2, t3, t0->, t44, k2->   <= // ->q1 is an intial state && t0-> is a final state && q1 is an intermediate state
```
> The end of the definition is marked by `<=`.

#### STATES
`STATES` is a reserved word that is always followed by the operator `=>` to indicate the set of states of the automata. In other programming languages `STATES` can be seen as `String, int, char...`

#### Set of states
The state names must be one lower case letter followed by a number `Example: q0`. The initial state is indicated by a right arrow `->` followed by the state name. The final state is indicated by the state name followed by a right arrow `->`. The intermediate state is indicated by the state name only. All the states must be separated by commas.



### The operator `=>`
The operator `=>` is used to separate the reserved word from the set of symbols of the alphabet, states or transitions that follow it.

### The operator `<=`
The operator `<=` is used to mark the end of the definition of the alphabet, states or transitions.



### Transitions definition
#### TRANSTITIONS
`TRANSITIONS` is a reserved word that is always followed by the operator `=>` to indicate the set of transitions of the automata. In other programming languages `TRANSITIONS` can be seen as `String, int, char...`

#### Set of transitions
The transitions of the automata represent the change of state that the automata goes through when it receives a specific input symbol. The transitions are defined by a state, an input symbol in square brackets `[]`, 3 points `...` and the state that the automata goes to after reading the input symbol. If the automata can go to multiple states after reading the input symbol, the states are separated by commas. The transitions are separated by `;`.

Example:
```
TRANSITIONS =>
->q0[a]...q1;
->q0[b]...t3,t44;
t3[a]...k2->, q1;
<=
```
> The end of the definition is marked by `<=`.

### Example of a complete automata definition

```javascript
// Alphabet definition
ALPHABET => a, b, c, d, e, f,g,h,i,     j <=

// States definition
STATES => ->q0, q1, ->q2, t3, t0->, t44, k2-> <=   // ->q1 is an intial state && t0-> is a final state

// Transitions definitions
TRANSITIONS =>
->q0[a]...q1;
->q0[b]...t3,t44;
t3[a]...k2->, q1;
<=
```

This automata accepts inputs of symbols a, b, c, d, e, f, g, h, i and goes through the following states when reading those symbols:

- From the initial state `q0` to the intermediate state `q1` after reading symbol `a`
- From the initial state `q0` to the intermediate states `t3` and/or `t44` after reading symbol `b`
- From the intermediate state `t3` to the final state `k2` and/or the intermediate state `q1` after reading symbol `a`.

### Implementation
When a token is recognized the program prints its name and representation. It also identifies errors and prints them.

### Tests
There are 2 files titled `test.txt` and `test2.txt` that were used to test the exercise. The first file should throw errors and the second should not.
