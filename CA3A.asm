.data
array:      .word 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
arrayLength: .word 10


.text
main:
    la $t2, array           #  $t2 is my arrya 
    li $t3, 10     #  $t3 is my length
    li $t0, 0            #  $t0 = I
    li $t5, 0               # Initialize the counter $t5 to 0

while:

    bge $t0, $t3, done     # If t0 >= arrayLength, exit the loop
    lw $t1, ($t2)          # t1 is my x and it loads elements from array in there 
    addi $t0, $t0, 1       # Increment by 1
    addi $t2, $t2, 4       # Move to the next element in the array (increment address by 4 bytes)
   
    bgt $t1,5	count # if t1 > 5 jump to add count 
    j while                 # Jump back to the beginning of the loop
    
count :
	addi $t5,$t5,1 # counter 
        j while    
             # Jump back to the beginning of the loop
done:
    #print out the counter (t5)
    move $a0, $t5           # Load $t5 into argument register $a0
    li $v0, 1                # Set syscall code 1 for printing integer
    syscall                 # Perform the syscall to print integer

    # Exit the program
    li $v0, 10               # Set syscall code 10 for program exit
    syscall
    
