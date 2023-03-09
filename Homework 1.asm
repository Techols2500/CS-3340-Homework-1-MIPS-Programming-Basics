# Homework 1
# Tyler Echols 
# This Program gets the user's name and 3 integers 
# Then calculates 3 expressions and displays the results 

	.data 
a:	.word	0
b:	.word	0
c:	.word	0
ans1:	.word	0
ans2:	.word	0
ans3:	.word	0
name:	.space	40	# Allocating Memory for name input  
msg1:	.asciiz		"what is your name? " 
msg2:	.asciiz		"Please enter an integer between 1-100: "
msg3:	.asciiz		"Your answers are: " 

	.text 
		
	# printing msg1  
	la 	$a0, msg1 
	li 	$v0, 4 
	syscall 
	 
	 #$a0 = address of input buffer $a1 = maximum number of characters to read
	 # v0=8 
	 
	 
	# recives user input 
	la 	$a0, name # storing valus for name  
	li	$a1, 39  # load immeadate 
	li	$v0, 8 # load immeadate 
	syscall 
	
	
	 
	
	# $a0 = character to print
	# v0=11
	
	# printing a new line character 
	li $a0, 10
	li $v0, 11 
	syscall 
	
	#enter integer from 1-100 
	la 	$a0, msg2 
	li 	$v0, 4 
	syscall  
	
	
	#recives integer
	li $v0, 5
	syscall
	
	#store integer 
	sw $v0, a 
	move $s1, $v0
	  
	
	#enter integer from 1-100 
	la 	$a0, msg2 
	li 	$v0, 4 
	syscall  
	
	#recives integer
	li $v0, 5
	syscall
	
	#store integer 
	sw $v0, b
	move $s2, $v0
	
	#enter integer from 1-100 
	la 	$a0, msg2 
	li 	$v0, 4 
	syscall   
	
	#recives integer
	li $v0, 5
	syscall
	
	#store integer 
	sw $v0, c 
	move $s3, $v0  
	
	
	
	# printing name   
	la 	$a0, name 
	li 	$v0, 4 
	syscall
	
	
	
	
	# printing msg3  
	la 	$a0, msg3 
	li 	$v0, 4 
	syscall 
	
	
	
	#Calculate ans1
	
	# $s1=a, $s3=c 
	# $t1 = new value 
	
	add $t1,$s1,$s1 # 2a
	sub $t1, $t1, $s3 # 2a -c 
	addi $t1, $t1, 4 # 2a - c + 4 
	sw $t1, ans1 # Answer for 2a - c + 4 
 
	
	
	
	#print out ans1 
	lw  	$a0, ans1 # Answer  
	li 	$v0, 1 # Display Answer 
	syscall  
	
	
	# printing a new line character 
	li    $v0, 11
   	li    $a0, 0x20
    	syscall
	
	
	#Calculate ans2 
	
	# $s1=a, $s2=b, $s3=c 
	# $t2 = new value 
	
	sub $t2, $s3, $s2 # b-c
	add $t2, $t2, $s1 # 
	sub $t2, $t2, 2 
	sw $t2, ans2  
	
	
	
	#print out ans2 
	lw  	$a0, ans2 # Answer  
	li 	$v0, 1 # Display Answer 
	syscall
	
	
	
	# printing a new line character 
	li    $v0, 11
   	li    $a0, 0x20
    	syscall
	
	
	#Calculate ans3 
	
	# $s1=a, $s2=b, $s3=c 
	# $t3 = new value 
	
	add $t3, $s1, 3
	sub $t4, $s2, 1
	sub $t3, $t3, $t4 
	add $t5, $s3, 3 
	add $t3, $t5, $t3 
	sw $t3, ans3  
	
	
	
	
	#print out ans3 
	lw  	$a0, ans3 # Answer  
	li 	$v0, 1 # Display Answer 
	syscall  
	
	
	# printing a new line character 
	li $a0, 10
	li $v0, 11 
	syscall
	
	
exit:		li	$v0, 10
		syscall 


# Test Values 1st apptempt 
# a=3
# b=3 
# c=3 

# ans1 = 7 
# ans2 = 1 
# ans3 = 10  

# What is your name? Tyler
# Please enter an integer between 1-100: 3
# Please enter an integer between 1-100: 3
# Please enter an integer between 1-100: 3
# Tyler
# your answers are 7 1 10 
#-- program is finished running -- 

# Test Values 2nd apptempt 
# a=8
# b=17 
# c=13

# ans1 = 7 
# ans2 = 2 
# ans3 = 11  

# What is your name? Tyler
# Please enter an integer between 1-100: 8
# Please enter an integer between 1-100: 17
# Please enter an integer between 1-100: 13
# Tyler
# your answers are 7 2 11 
#-- program is finished running -- 


