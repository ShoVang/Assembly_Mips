.data
entryText: .asciiz "What is the result of 5+5? "
correct: .asciiz "Correct "
wrong: .asciiz "Wrong answer! "
guseAgain: .asciiz "Wrong answer! Guess again."
li $t0, 0 # this is the count

.text
main:
while:
    addi $t0, $t0, 1
    beq $t0, 4, done  # Changed to 4 for three chances

    li $v0, 4  # print out entry message to get game started
    la $a0, entryText
    syscall

    li $v0, 5  # input grabber
    syscall
    move $t1, $v0  # user input to $t1

    beq $t1, 10, correctAnswer  # comparison

    li $v0, 4  # wrong answer
    la $a0, guseAgain  # Corrected typo
    syscall
    j while

correctAnswer:  # correct input
    li $v0, 4
    la $a0, correct
    syscall
    j done

done:
    li $v0, 10
    syscall
