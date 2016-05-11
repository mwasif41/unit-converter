.data
#####################filing######################
fout1:   .asciiz "temp.txt"      # filename for output
fout2:   .asciiz "length.txt"      # filename for output
fout3:   .asciiz "wt.txt"      # filename for output
null: .word 0000# for itoa
buffer: .asciiz "\nconvertion result is:"
x: .space 14
res: .space 1024
####################
greet: .asciiz"\n**********WELCOME USER************* "
end: .asciiz"\n THANKS FOR USING"
temp: .asciiz "\nEBTER 1 FOR TEMPRETURE CONVERION"
length: .asciiz "\nEBTER 2 FOR LENGTH CONVERION"
weigth: .asciiz "\nEBTER 3 FOR WEIGHT CONVERION"
exit: .asciiz "\nEBTER 4 FOR EXIT"

ch:	.asciiz	"\nEnter your choice: "
in:	.asciiz	"\nEnter Value: "
result:	.asciiz	"\nResult is: "
############# temp ################
inputc:	.asciiz	"\nPress 1 to convert Celcius into Farenheit"
inputf:	.asciiz	"\nPress 2 to convert Farenheit into Celcius"
f:	.float 0.555555
c:	.float 1.8
m:	.float 32.0
########### length #################
inputm:	.asciiz	"\nPress 1 to convert meter into ft"
inputft:	.asciiz	"\nPress 2 to convert ft into meter"

mtof: 	.float 3.28
ftom:	.float 0.30487
########### weigth #################
inputkg:	.asciiz	"\nPress 1 to convert kilogram into pounds"
inputlb:	.asciiz	"\nPress 2 to convert pounds into kilogram"
kgtolb: 	.float 2.20462
lbtokg:		.float 0.453592
.text
.globl main
	####	greet #########
	la $a0, greet
	li $v0, 4
	syscall

main:
############### MAIN MENU FOR ALL UNITS ##################
	la $a0,	temp
	li $v0, 4
	syscall
	
	la $a0,	length
	li $v0, 4
	syscall

	la $a0, weigth
	li $v0, 4
	syscall
	
	la $a0, exit
	li $v0, 4
	syscall

	li $v0,5		#read integer
	syscall
	
	move $t0,$v0
		
	beq $t0,1,tempreture  	
	beq $t0,2,length1	
	beq $t0,3,weigth1		
	beq $t0,4,exit1		

tempreture:
    ########## main menu for temp section###############
	la $a0,	inputc
	li $v0, 4
	syscall
	
	la $a0,	inputf
	li $v0, 4
	syscall
	
	la $a0,	ch		#print string or char
	li $v0, 4
	syscall
	
	li $v0,5		#read integer
	syscall
	
	move $t0,$v0
		
	beq $t0,1,Celcius  	#either clecius to farhenhiet 
	beq $t0,2,Farenheit	#or farhenhiet ti celcius
	
Celcius:

	la $a0,	in		#asking for value to change
	li $v0, 4
	syscall
	
	li $v0,6		#reading float
	syscall
	
	mov.s $f3,$f0		# f3= value
	l.s $f4,c		# f4=c = 1.8
	mul.s $f5,$f3,$f4	#ans = val *  1.8
	l.s $f6,m		# f6 = m =32
	add.s $f7,$f5,$f6	# result = ans + 32
	
	la $a0,	result
	li $v0, 4
	syscall
	
	mov.s $f12,$f7	# 2 is for print float
	li $v0,2
	syscall
	
	li $t1,1
	jal filing
	j main
 		
Farenheit:
	
	la $a0,	in 		#take input
	li $v0, 4
	syscall
	
	li $v0,6 	# read float
	syscall
	
	mov.s $f3,$f0	  # f3= input
	l.s $f4,m	# f4 = m =32
	sub.s $f5,$f3,$f4		# ans = f5 = input -32
	l.s $f6,f			# f6 = f =.555555
	mul.s $f7,$f5,$f6		# ans*f
	
	la $a0,	result
	li $v0, 4
	syscall
	
	mov.s $f12,$f7
	li $v0,2
	syscall
	
	li $t1,1
	jal filing
	
	j main
length1:

 ########## main menu for length section###############
	la $a0,	inputm
	li $v0, 4
	syscall
	
	la $a0,	inputft
	li $v0, 4
	syscall
	
	la $a0,	ch		#print string or char
	li $v0, 4
	syscall
	
	li $v0,5		#read integer
	syscall
	
	move $t0,$v0
		
	beq $t0,1,meter  	
	beq $t0,2,ft	
	
meter:
	
	la $a0,	in		#asking for value to change
	li $v0, 4
	syscall
	
	li $v0,6		#reading float
	syscall
	
	mov.s $f3,$f0		
	l.s $f4,mtof		
	mul.s $f5,$f3,$f4	
	
	la $a0,	result
	li $v0, 4
	syscall
	
	mov.s $f12,$f5	# 2 is for print float
	li $v0,2
	syscall
	
	li $t1,2
	jal filing
	
	j main
	
	
	ft:
	
	la $a0,	in		#asking for value to change
	li $v0, 4
	syscall
	
	li $v0,6		#reading float
	syscall
	
	mov.s $f3,$f0		
	l.s $f4,ftom		
	mul.s $f5,$f3,$f4	
	
	la $a0,	result
	li $v0, 4
	syscall
	
	mov.s $f12,$f5	# 2 is for print float
	li $v0,2
	syscall
	
	li $t1,2
	jal filing
	
	j main
weigth1:
 ########## main menu for weigth section###############
	la $a0,	inputkg
	li $v0, 4
	syscall
	
	la $a0,	inputlb
	li $v0, 4
	syscall
	
	la $a0,	ch		#print string or char
	li $v0, 4
	syscall
	
	li $v0,5		#read integer
	syscall
	
	move $t0,$v0
		
	beq $t0,1,kg  	
	beq $t0,2,lbs	

kg:
	la $a0,	in		#asking for value to change
	li $v0, 4
	syscall
	
	li $v0,6		#reading float
	syscall
	
	mov.s $f3,$f0		
	l.s $f4,kgtolb		
	mul.s $f5,$f3,$f4	
	
	la $a0,	result
	li $v0, 4
	syscall
	
	mov.s $f12,$f5	# 2 is for print float
	li $v0,2
	syscall
	
	li $t1,3
	jal filing
	
	j main

lbs:

	la $a0,	in		#asking for value to change
	li $v0, 4
	syscall
	
	li $v0,6		#reading float
	syscall
	
	mov.s $f3,$f0		
	l.s $f4,lbtokg		
	mul.s $f5,$f3,$f4	
	
	la $a0,	result
	li $v0, 4
	syscall
	
	mov.s $f12,$f5	# 2 is for print float
	li $v0,2
	syscall
	
	li $t1,3
	jal filing
	
	j main
exit1:

	li $v0,10 	# 10 is for exit
	syscall
		

########################################################################################################################
filing:
  cvt.w.s $f0,$f12   # f0 = integer single precision value of f12
  mfc1 $t0,$f0       #move from co processor 1 : t0=f0
  ###################################################################################
ita:
add $t0,$zero,$t0
move $t6,$t0  # t6 value to store
move $t8,$sp	#stack value store
loop:
addi $s3,$zero,10	# $s3=10
div  $t6,$s3	
mflo $t6	#qoutient t6
mfhi $t7	# remainder t7
addi $t7,$t7,48 # to make t7 astring
addi $sp,$sp,-1 # inc stack
sb $t7,0($sp) #stack store t7
bnez $t6,loop #when value in 0 break the loop

la $t9,res    # string to save 

storeToRes:
lb $t6,0($sp)	#upeer value load
sb $t6,0($t9)	# value store in string
addi $sp,$sp,1	#dec srting
addi $t9,$t9,1 # string inc
bne $t8,$sp,storeToRes	# sp to its intial position
la $t6,null	#addtnull o the string
sb $t9,0($t6)

 
  ###############################################################
  # Open (for writing) a file that does not exist
  li   $v0, 13       # system call for open file
  
  beq $t1,1 t		#checking for different conditionds in which file to write???
  beq $t1,2 l
  beq $t1,3 w
  
  t:
  la   $a0, fout1     # output file name
 j cont
   l:
  la   $a0, fout2     # output file name
 j cont
   w: 	
   la   $a0, fout3     # output file name
  
  cont:
  li   $a1, 1        # Open for writing (flags are 0: read, 1: write)
  li   $a2, 0        # mode is ignored
  syscall            # open a file (file descriptor returned in $v0)
  move $s6, $v0      # save the file descriptor 
  ###############################################################
  # Write to file just opened
  li   $v0, 15       # system call for write to file
  move $a0, $s6      # file descriptor 
  la   $a1, buffer   # address of buffer from which to write
  li   $a2, 23       # hardcoded buffer length
  syscall            # write to file
  
  		############
 li   $v0, 15       # system call for write to file
  move $a0, $s6      # file descriptor
  
  la   $a1, res   # address of buffer from which to write
 
    ###################################################################################
  #sw $t9,0($a1)
  #swc1 $f12,0($a1)
  li   $a2, 1024       # hardcoded buffer length
  syscall            # write to file
  		###########
 
  ###############################################################
  # Close the file 
  li   $v0, 16       # system call for close file
  move $a0, $s6      # file descriptor to close
  syscall            # close file
  ###############################################################
jr $ra


