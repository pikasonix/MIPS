# abs $s0,$s1
.text
	li $s1, 0xffffffff # gán giá trị cho s1 
	slt $t0,$zero,$s1  # t0 = 0 < s1 ? 1 : 0
	bne $t0,$zero,END  # 0 >= s1 -> END
	sub $s1,$zero,$s1  # 0 < s1: s1 = -s1
END:	add $s0,$zero,$s1  # s0 = s1