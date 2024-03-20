#Laboratory Exercise 3, Assignment 4_c
.text
	addi $s1,$s1,2		#i=2
	addi $s2,$s2,-5		#j=-5
	
	add $s3,$s1,$s2 	# s3 = i+j
	slt $t0,$zero,$s3	# t0 = 0<(i+j) ? 1:0
	bne $t0,$zero,else 	# branch to else if 0<(i+j)
	addi $t1,$t1,1 			# then part: x=x+1
	addi $t3,$zero,1 		# z=1
	j endif 		# skip “else” part
else: addi $t2,$t2,-1 		# begin else part: y=y-1
	add $t3,$t3,$t3 		# z=2*z
endif:		
