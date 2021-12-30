#bobbleSort()
    .data
array: .space 40
spac: .asciiz " "
nl: .asciiz "\n"
input: .asciiz "enter 10 numbers:\n"
    .text
main:
    jal newArray
    addi $a1, $zero, 10
    jal sort
    jal printArray
    li $v0, 10
    syscall
swap:
    lw $t1, 0($a1)
    lw $t2, 4($a1)
    sw $t2, 0($a1)
    sw $t1, 4($a1)
    j for2
sort:
    la $s2, array
    addi $s0, $a1, -1
for1:
    slt $t0, $zero, $s0
    beq $t0, $zero, exit1
    addi $s1, $zero, -1
for2:
    addi $s1, $s1, 1
    slt $t0, $s1, $s0
    beq $t0, $zero, exit2
    sll $t0, $s1, 2
    add $a1, $s2, $t0
    lw $t1, 0($a1)
    lw $t2, 4($a1)
    slt $t0, $t1, $t2
    beq $t0, $zero, swap
    j for2
exit2:
    addi $s0, $s0, -1
    j for1
exit1:
    jr $ra
newArray:
    li $v0, 4
    la $a0, input
    syscall
    la $t1, array
    addi $s0, $zero, 0
for3:
    slti $t0, $s0, 10
    beq $t0, $zero, exit3
    li $v0, 5
    syscall
    sw $v0, 0($t1)
    addi $t1, $t1, 4
    addi $s0, $s0, 1
    j for3
exit3:
    jr $ra
printArray:
    addi $s0, $zero, 0
    la $t1, array
for4:
    slti $t0, $s0, 10
    beq $t0, $zero, exit4
    lw $a0, 0($t1)
    li $v0, 1
    syscall
    la $a0, spac
    li $v0, 4
    syscall
    addi $t1, $t1, 4
    addi $s0, $s0, 1
    j for4
exit4:
    la $a0, nl
    li $v0, 4
    syscall
    jr $ra