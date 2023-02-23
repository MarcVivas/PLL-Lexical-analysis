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

## Introduction
The objective of this project is to use an automatic lexical analyzer generation tool to recognize different languages.

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
