# int fib(int n) {
#   if (n==0)
#       return(0);
#   else if (n==1)
#       return(1);
#   else
#       return( fib(n-1) + fib(n-2) );
# }

        .data

        .text
        .global main

main:
    jal fib

fib:
    # arguments: 
    addi $sp, $sp, -8
    sw $ra, 4($sp)
    sw $a0, 0($sp)