
; FIBONACCI SEQUENCE MADE IN ASSEMBLY x86-64

; A code entirely made in assembly language x86-64 that get a number from user input and display its Fibonacci sequence.  
; it uses the main rax and rbx registers to store the values of number1 and number2 as variables.
; the sum of the two number is then displayed on screen and the registers will be updated with new values
; the process is then repeated untill all the Fibonacci sequence numbers are displayed on screen


; Instructions to assemble code and generate an executable file (Linux enviroment) :

; SIMPLE ASSEMBLING:
; An assembly script usually has the (.s extension)
; use nasm to convert it to machine code (.o extension):
; nasm -f elf64 filename.s
; then link it using ld, it will generate the actual executable:
; ld -o helloWorld helloWorld.o

; ADVANCED ASSEMBLING COMMAND - ASSEMBLE AND RUN WITH DYNAMIC LINKER - USE THIS COMMAND FOR THE SCRIPT:
; nasm -f elf64 fibonacci.s &&  ld fibonacci.o -o fibonacci -lc --dynamic-linker /lib64/ld-linux-x86-64.so.2 && ./fibonacci




; @author: ringzerocode
; @version: 0.1



global  _start                              ; rappresents main assembly method, the section _start will be executed. 
extern  printf, scanf                       ; import external c libraries

section .data                                           ; data section of the code store variables and other useful values
    message db "Please input max Fn: ", 0x0a            ; intro message stored as string
    outFormat db  "%d", 0x0a, 0x00                      
    inFormat db "%d", 0x00                          

section .bss
    userInput resb 1

section .text
_start:
    call printMessage   ; print intro message
    call getInput       ; get input from user
    call initFib        ; set initial Fib values
    call loopFib        ; calculate Fib numbers
    call Exit           ; exit the program



getInput:
    sub rsp, 8          ; align stack to 16-bytes
    mov rdi, inFormat   ; set 1st parameter (inFormat)
    mov rsi, userInput  ; set 2nd parameter (userInput)
    call scanf          ; call scanf function
    add rsp, 8
    ret

printMessage:
    mov rax, 1      ; rax: syscall number 1
    mov rdi, 1      ; rdi: fd 1 for stdout
    mov rsi,message ; rsi: pointer to message
    mov rdx, 20     ; rdx: print length of 20 bytes
    syscall         ; call write syscall to the intro message
    ret

initFib:
    xor rax, rax    ; initialize rax to 0
    xor rbx, rbx    ; initialize rbx to 0
    inc rbx         ; increment rbx to 1
    ret

loopFib:
    call printFib   ; print current Fib number
    add rax, rbx    ; get the next number
    xchg rax, rbx   ; swap values
    cmp rbx, [userInput]     ; do rbx - 10
    js loopFib      ; jump if result is <0
    ret

printFib:
    push rax            ; push registers to stack
    push rbx
    mov rdi, outFormat  ; set 1st argument (Print Format)
    mov rsi, rbx        ; set 2nd argument (Fib Number)
    call printf         ; printf(outFormat, rbx)
    pop rbx             ; restore registers from stack
    pop rax
    ret

Exit:
    mov rax, 60
    mov rdi, 0
    syscall








