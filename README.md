# Fibonacci


FIBONACCI SEQUENCE MADE IN ASSEMBLY x86-64

@author: ringzerocode

@version: 0.1


A code entirely made in assembly language x86-64 that get a number from user input and display its Fibonacci sequence,  
it uses the main rax and rbx registers to store the values of number1 and number2 as variables,
it then executes the sum of the two number that is displayed on screen and the registers will be updated with new values
the process is then repeated untill all the Fibonacci sequence numbers are displayed on screen.


Instructions to assemble code and generate an executable file (Linux enviroment) :

MANUAL ASSEMBLING:

- An assembly script usually has the (.s extension)

- use nasm to convert it to machine code (.o extension):
  nasm -f elf64 fibonacci.s

- then link it using ld, it will generate the actual executable:
  ld -o fibonacci ficonacci.o
