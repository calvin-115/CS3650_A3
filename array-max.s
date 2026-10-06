.global array_max
 
.text
 
array_max:

  enter $0, $0
 
  movq $0, %rax
  movq $0, %rcx
 
loop:
  cmpq %rdi, %rcx
  jae loop_done
 
  movq (%rsi,%rcx,8), %rdx
 
  cmpq %rax, %rdx
  jbe next
  movq %rdx, %rax
 
next:
  incq %rcx
  jmp loop
 
loop_done:
  leave
  ret
 
