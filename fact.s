#fact()
    .data
input: .asciiz "Enter a integer (0~12) to count the factorial: "
    .text
main:
    li $v0, 4
    la $a0, input
    syscall
    li $v0, 5
    syscall
    addi $a0, $v0, 0
    jal fact
    li $v0, 1
    syscall
    li $v0, 10
    syscall
fact:
    addi $sp, $sp, -8
    sw $ra, 4($sp)
    sw $a0, 0($sp)
    slti $t0, $a0, 1
    beq $t0, $zero, L1
    li $a0, 1
    addi $sp, $sp, 8
    jr $ra
L1:
    addi $a0, $a0, -1
    jal fact
    lw $t0, 0($sp)
    lw $ra, 4($sp)
    addi $sp, $sp, 8
    mul $a0, $t0, $a0
    jr $ra
#Happy new year
#2022