.data
	text1: .asciiz "The sum of "
	text2: .asciiz " and "
	text3: .asciiz " is "
.text
	li $s0, 10
	li $s1, 12
	
	li $v0, 4
	la $a0, text1
	syscall
	li $v0, 1
	add $a0, $s0,$zero
	syscall
	li $v0, 4
	la $a0, text2
	syscall
	li $v0, 1
	add $a0, $s1,$zero
	syscall
	li $v0, 4
	la $a0, text3
	syscall
	li $v0, 1
	add $a0, $s1, $s0
	syscall
	