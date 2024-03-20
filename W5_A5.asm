.data
	string: .space 21
	Message1: .asciiz "Nhap xau: "
	Message2: .asciiz "Do dai xau la: "
.text
main:
get_string: 	
		li $v0, 54
		la $a0, Message1
		la $a1, string
		la $a2, 21
		syscall
		
		li $t3, '\n'
get_length:
		la $a2, string 			# $a0 = address(string[0])
		add $t0,$zero,$zero 		# $t0 = i = 0
check_char: 	
		add $t1,$a2,$t0 		# $t1 = $a0 + $t0
						# = address (string[i])
		lb $t2, 0($t1) 			# $t2 = string[i]
		beq $t2, $zero, end_of_str 	# is null char?
		beq $t2, $t3, end_of_str 	# is \n char?
		addi $t0, $t0, 1 		# $t0 = $t0 + 1 -> i = i + 1
		j check_char
end_of_str:
end_of_get_length:
print_length: 	
		li $v0, 56
		la $a0, Message2
		add $a1, $t0,$zero
		syscall		