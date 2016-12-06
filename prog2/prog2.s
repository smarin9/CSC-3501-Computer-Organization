.globl prog2

prog2:
         
        #Startup
        
#Pushes %ebp onto the stack
        pushl   %ebp
#Moves the stack from %esp to %ebp
        movl %esp, %ebp
#Pushes %ebx onto the stack
        pushl %ebx

        #Subtracting j-i

#Moves j to register %eax
        movl 12(%ebp), %eax
#Moves i to resgister %ecx
        movl 8(%ebp), %ecx
#Subtracts j-i
        subl %ecx, %eax

        #Multiplying *k

#Moves the pointer value to %ebx
        movl 16(%ebp), %ebx
#Moves k to %edx register
        movl (%ebx), %edx
#Left shift of k
        sall $2, %edx
#Adds k to k*4
        addl (%ebx), %edx
#Moves k to pointer
        movl %edx, (%ebx)

        #Array Sum

#Moving the array into %edx
        movl 20(%ebp), %edx
#Moving 'l' into %ecx
        movl 24(%ebp), %ecx
#Moving 0 into %edi
        movl $0, %edi
#Adds a[0] to %edi
        addl (%edx), %edi
#Points to the next value in the array
        addl $4, %edx
#Adds a[1] to %edi
        addl (%edx), %edi
#Points to the next value in the array
        addl $4, %edx
#Adds a[2] to %edi
        addl (%edx), %edi
#Points to the next value in the array
        addl $4, %edx
#Adds a[3] to %edi
        addl (%edx), %edi
#Points to the next value in the array
        addl $4, %edx
#Adds a[4] to %edi
        addl (%edx), %edi
#Moves l to the pointer
        movl %edi, (%ecx)


        #Finish

#Removes %ebx from the stack
        popl %ebx
#Removes %ebp from the stack
        popl %ebp
#Returns value
        ret

        #implement here