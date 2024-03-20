#Laboratory Exercise 4, Assignment 2
.text
	li $s0, 0x12345678 		# load test value for these function
	andi $t0, $s0, 0xff000000	# Extract MSB of $s0
	andi $s0, $s0, 0xffffff00	# Clear LSB of $s0
	andi $s0, $s0, 0x00000000	# Clear $s0