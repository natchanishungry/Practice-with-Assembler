
	.data 	     		# Data Segment
array:	.space 40    		# int array[10];
str1:	.asciiz "enter a number: \n"
str2: 	.asciiz "the sum is "

	.text 	     		# Text Segment
main:  	#subi $sp, $sp, 4	# make space on stack for int i and int sum
	li $s0, 0	        # sum is $v0
	li $t0, 0   	        # $t0 is local variable i
	
	#sw   $s0, 0($sp)     	# store sum on stack
	li $t1, 10              # $t1 is 10
	la $t2, array 		# load address of array into $t2, use $t2 as offset to go through array
	j    for
	
for:	beq  $t0, $t1, next
	la $a0, str1     	# Load the address of str into register $a0
	li $v0, 4		# Tell the OS to use library 4 (print a string)
	syscall			# printf
	
	li $v0, 5		# Tell the OS to use library 5 (read an int)
	syscall			# scanf
	
	sw $v0, 0($t2)		# put the scanned number into array[i]
	add $t2, $t2, 4 	# increment to next spot in array
	addi $t0, $t0, 1        # increment i
	j for
    
next:	la $t0, array		# put array into $t0
	addi $t1, $t0, 40	# put array+10 into $t1
	
	lw $a0, array		# $a0 is array[0]
	jal sum	 		# jump to summation function 
	j end

sum:   	subi $sp, $sp, 8	# make room for 2 registers
	sw $ra, 4($sp)
	sw $a0, 0($sp)
	bne $t0, $t1, L1 	# if(a!=last)
	addi $sp, $sp, 8	# pop
	jr $ra	
	
L1:	addi $t0, $t0, 4 	# a = a+1
	lw $a0, 0($t0)          # $a0 = a*
	jal sum			# recursion
	lw $a0, 0($sp) 		
	lw $ra, 4($sp)
	add $v1, $v1, $a0	# $v1 = result
	addi $sp, $sp, 8        # pop
	jr $ra    
	
end: 	la $a0, str2     	# Load the address of str into register $a0
	li $v0, 4		# Tell the OS to use library 4 (print a string)
	syscall			# printf

	la $a0, 0($v1)     	# Load the address of $v0 into register $a0
	li $v0, 1		# Tell the OS to use library 1 (print an int)
	syscall			# Call the library function
	
	li $v0, 10		# Tell the OS to use library 10 (exit program)
	syscall			# Call the library function