.data
A: .word -2, 1, 1, 1, 1

.text
	la $a0, A # a0 địa chỉ A[0]
	li $a1, 5 # a1 = 5		(a1 = n)
	j  mspfx  # -> mspfx
continue:
lock: 	j lock
	nop
end_of_main:


mspfx:	addi $v0,$0,0 # v0=0		(v0 = length)
 	addi $v1,$0,0 # v1=0		(v1 = max sum)
 	addi $t0,$0,0 # t0=0		(t0 = i)
 	addi $t1,$0,0 # t1=0		(t1 = sum)
 	
loop: 	sll $t2,$t0,2 	# t2 = 4t0	
	add $t3,$t2,$a0 # t3 = t2 + a0	(t3 = địa chỉ A[i])
	lw $t4,0($t3)	# t4 = A[i]	(t4 = A[i])
	add $t1,$t1,$t4	# t1 = t1 + t4	(sum = sum + A[i])
	slt $t5,$v1,$t1 # t5 = (v1<t1)?1:0 
 	bne $t5,$0,mdfy	# t5!=0->mdfy 	(if (maxsum < sum) -> mdfy)
 	j test		#		(else -> test)
 	
 mdfy:	addi $v0,$t0,1 	# v0 = t0 + 1	(length = i + 1)
 	addi $v1,$t1,0	# v1 = t1 	(maxsum = sum)
 	
 test:	addi $t0,$t0,1 # t0 = t0 +1 	(i++)
 	slt  $t5,$t0,$a1 # t5 = (t0<a1)?1:0 
 	bne $t5,$0,loop	# t5!=0->loop 	(if (i < n) -> loop)
done: 	j continue	# ----> END <----
mspfx_end: 	
