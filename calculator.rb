#!/usr/bin/env ruby
# #############################################################################
# course: cmps3500
# CLASS Project
# RUBY IMPLEMENTATION OF A CUSTOM SCIENTIFIC CALCULATION
# date: 07/15/2021
# Student 1: Janneth Guarcas Garcia
# Student 2: none
# description: Implementation of a scientific calculator in Ruby
# #############################################################################

# #############################################################################
# function definitions

# display menu
def display_menu

    puts "----------------------------------------------------------------\n" + 
        "Menu: Choose Which Operation to Perform" + 
        "\n----------------------------------------------------------------"
    puts "Choice\tDescription\n"
    # puts puts puts puts vs puts + + + + 

    puts "1\tAddition"
    puts "2\tSubtraction"
    puts "3\tMultiplication"
    puts "4\tDivision"
    puts "5\tDONT PICK ME OR HIGHER :)"

end

# to check if user wants to continue using calculator
def check_continue
    valid = false
    while !valid
        # is this user friendly? lol
        print "\nDo you have more operations to perform? [Y]es or [N]o: "
        cont = gets.chomp
        cont = cont.downcase
        if cont == "y" || cont == "n"
            user_input = cont
            valid = true
        else
            puts "Invalid choice. Try again"
        end
    end
    return user_input
end

# #############################################################################
# variables (may move this section)



# #############################################################################
# main script

user_input = "y"

while user_input == "y" || user_input == "Y"
    display_menu
    print "\nEnter choice selection number (1-xx): "
    selection = gets.chomp

    case selection
    when '1'
        puts "\nEnter the numbers you wish to ADD: "
    when '2'      
        puts "\nEnter the numbers you wish to SUBTRACT in order: "
    when '3'
        puts "\nEnter the numbers you wish to MULTIPLY: "
    when '4'
        puts "\nEnter the numbers you wish to DIVIDE. Dividend, then divisor(s): "
    # below cases are harvest from matrix calculator
    when '5'
        if matrix_A.empty?
            print "\n"
        else
            print "Enter an integer to scale Matrix A: "
            user_scale_A = gets.chomp.to_i
            matrix_A = scale_A(user_scale_A, matrix_A)
        end
    when '6'
        if matrix_B.empty?
            print "\n"
        else
            print "Enter an integer to scale Matrix B: "
            user_scale_B = gets.chomp.to_i
            matrix_B = scale_B(user_scale_B, matrix_B)
        end
    when '11'
        if matrix_A.empty?
            print"\nMatrix A is EMPTY! Please Load Matrix B\n"
        else
            inverse_A(matrix_A)
        end
    when '12'
        if matrix_B.empty?
            print"\nMatrix B is EMPTY! Please Load Matrix B\n"
        else
            inverse_B(matrix_B)
        end
    else
        puts "NOT a valid choice, please try again."
    end
    user_input = check_continue
end
puts "Goodbye"
