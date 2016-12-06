.global check_cache

check_cache:
                                #Start
        pushl   %ebp
        movl    %esp,   %ebp

        movl 8(%ebp),   %edi    #Sets %edi as the pointer
        movb 12(%ebp),  %ch     #Address is copied into %ch
        movb %ch,       %cl     #Address is copied into %cl
        shrb $4,        %cl     #Removes the 4 rightmost bits and shifts right
        movb %ch,       %dh     #Address is copied into %dh
        salb $4,        %dh     #Removes the 4 leftmost bits and shifts left
        shrb $6,        %dh     #Removes the 6 rightmost bits and shifts right
        movb %ch,       %dl     #Address is copied into %dl
        salb $6,        %dl     #Removes the 6 leftmost bits and shifts left
        shrb $6,        %dl     #Removes the 6 rightmost bits and shifts right
        movzbl %dh,     %esi    #Converts offset to long
        imull $6,       %esi    #Multiples offset %esi
        addl %esi,      %edi    #%esi is added to %edi

        movb (%edi),    %bh     #Char is moved into %bh
        cmp $0,        %bh      #Compares %bh to see if it's equal to 0, then j$
        je      .L2

        movb 1(%edi),   %bl     #Char tag is moved to %bl
        cmp %bl,       %cl      #Compares %bl and %cl for equality. If equal, s$
        jne     .L2

        addl $2,        %edi    #%edi incremented by 2
        movzbl %dl,     %esi    #Block offset converted to long
        addl %esi,      %edi    #Block offset is added to %edi

        movb (%edi),    %al     #Data is moved to %al then jumps
        jmp     .L1

        .L2:
        movb $0xFF,     %al     #Marks the return value as a miss

                                #Finish and return
        .L1:
        popl    %ebp
        ret





