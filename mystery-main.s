.global main

.text

main:
  enter $0, $0
  push %rbx
  push %r12

  cmpl $3, %edi
  jne wrong_args

  movq %rsi, %rbx

  movq 8(%rbx), %rdi
  call atol
  movq %rax, %r12

  movq 16(%rbx), %rdi
  call atol

  movq %r12, %rdi
  movq %rax, %rsi
  call crunch

  cmpq $0, %rax
  jl print_hat

  je print_tea

  movq $beer_msg, %rdi
  jmp print_answer

print_hat:
  movq $hat_msg, %rdi
  jmp print_answer

print_tea:
  movq $tea_msg, %rdi

print_answer:
  call puts
  movq $0, %rax
  jmp done

wrong_args:
  movq $error_msg, %rdi
  call puts
  movq $1, %rax

done:
  pop %r12
  pop %rbx
  leave
  ret

.data
error_msg:
  .asciz "Two arguments required."
hat_msg:
  .asciz "hat"
tea_msg:
  .asciz "tea"
beer_msg:
  .asciz "beer"
