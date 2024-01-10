# Author: Krista Smith
# Date: 9/14/23
# Description: The program will print a message, receive input from users, 
	# and subtract numbers entered by the user.
	
# Test Cases: 
# input two positive numbers, end with negative: for 15 and 10, 5 is the expected output; 
#	5 - 20 should be -15
# input 2 positives, end with positive: 45 - 5 = 40; 40 - 20 = 20
# input a positive and negative number, end with positive: expected output for 15 and -5 is 20;
#	20 - 20 should be 0
# input positive and negative, negative result: -1 - 20 = -21; 
#	-21 - 20 = -41
# input 2 negatives, end with negative: (-10) - (-5) = (-5); (-5) - 20 is (-25)
# input 2 negatives, end with positive: (-1) - (-11) = 10; 10 - 20 = -10
# invalid input - expect program to fail when a number and a letter are input
# no input - expect program to crash when no integers are entered for the first or second value

# Registers used: 
# $v0 - syscall parameter and return value
# $a0 - syscall parameter for string to print
# $t0 - used to hold first number
# $t1 - used to hold second number
# $t2 - used to hold difference of $t0 and $t1
# $t3 - used to hold difference of $t2 and 20

# data segment
.data
name: .asciiz "Krista Smith"	
hw: .asciiz "\nProgram Assignment #1"
info: .asciiz "\nA program that adds two numbers"
question1: .asciiz "\nEnter a number: "
difference: .asciiz "\nThe difference of the two numbers is: "
subtract: .asciiz "\nThe new difference after subtracting 20 is: "


# text segment
.text
# print user information
	# print name string
	li $v0, 4
	la $a0, name
	syscall
	
	# print hw string
	li $v0, 4
	la $a0, hw
	syscall
	
	# print info string
	li $v0, 4
	la $a0, info
	syscall

# take user input for two numbers
	# print prompt
	li $v0, 4
	la $a0, question1
	syscall
	
	# store first number entered by user
	li $v0, 5	# receive input from user
	syscall
	move $t0, $v0	# move input from $v0 to $t0
	
	# print prompt
	li $v0, 4
	la $a0, question1
	syscall
	
	# store second number entered by user
	li $v0, 5	# receive input from user
	syscall
	move $t1, $v0	# move input from $v0 to $t1

	# calculate difference of integers
	sub $t2, $t0, $t1	# subtract $t0 - $t1 and store in $t2

	# display difference
	# print difference string
	li $v0, 4
	la $a0, difference
	syscall
	
	# print integer
	li $v0, 1	
	move $a0, $t2	# move value from $t2 to $a0
	syscall
	
# subtract an immediate value
	# subtract $t2 - 20 and store in $t3
	subi $t3, $t2, 20
	
	# print subtract string to label results
	li $v0, 4
	la $a0, subtract
	syscall
	
	# print integer
	li $v0, 1
	move $a0, $t3 # move value in $t3 to $a0 to print
	syscall
	

# clean exit
	li $v0, 10
	syscall
