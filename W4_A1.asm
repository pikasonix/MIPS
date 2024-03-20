#Laboratory Exercise 4, Assignment 1
.text
	add $s1,$zero, 0x9ffffff0
	add $s2,$zero, 0xbffffff2
start:
	li $t0,0 		# t0 = 0	
	addu $s3,$s1,$s2 	# s3 = s1 + s2
	xor $t1,$s1,$s2 	# xét s1, s2: cùng dấu t1 > 0 ; trái dấu t1 < 0
	bltz $t1,EXIT 		#t1 < 0, -> EXIT
	slt $t2,$s3,$s1		# t2 = s3 < s1 ? 1 : 0 
	bltz $s1,NEGATIVE 	# s1 và s2 cùng âm -> NEGATIVE
	beq $t2,$zero,EXIT 	# Nếu s3 >= s1 -> EXIT (không tràn)
	j OVERFLOW		# -> OVERFLOW
NEGATIVE:			# (s1 và s2 cùng âm)
	bne $t2,$zero,EXIT 	# Nếu s3 <= s1 (không tràn số)
OVERFLOW:			# (tràn số)
	li $t0,1 		# t0 = 1 
EXIT: