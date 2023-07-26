# miniNTKernel
Use C++, a minimal operating system kernel that supports 32-bit.
## Make you bin file
your script head must is:
```ASM
SECTION header vstart=0                     
    program_length  dd program_end          
    
    ;用户程序入口点
    code_entry      dw start                
                    dd section.code_1.start 
    realloc_tbl_len dw (header_end-code_1_segment)/4   
    code_1_segment  dd section.code_1.start ;[0x0c]
    code_2_segment  dd section.code_2.start ;[0x10]
    data_1_segment  dd section.data_1.start ;[0x14]
    data_2_segment  dd section.data_2.start ;[0x18]
    stack_segment   dd section.stack.start  ;[0x1c]
    
    header_end:  
    ; ---
    ; Your asm script
    ; ---
``` 
## Function
If you want to use system call,you must include "system/lib/stdc++.h".
Can use function:
- random
- randint
- choice
- printf
- io_hlt
- clear
- unrandint
- randomString
- celi
- floor
- round
- abs
- sqrt
- pow
- cputime
- breakdown
