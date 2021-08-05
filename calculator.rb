#!/usr/bin/env ruby
# #############################################################################
# course: cmps3500
# CLASS Project
# RUBY IMPLEMENTATION OF A CUSTOM SCIENTIFIC CALCULATION
# date: 07/15/2021
# Student 1: Janneth Guarcas Garcia
# Student 2: n/a
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
    puts "5\tSine (degree mode)"
    puts "6\tCosine (degree mode)"
    puts "7\tTangent (degree mode)"
    puts "\tDONT PICK ME OR HIGHER :)"

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
        #make function later
        puts "\nEnter the numbers you wish to ADD: "
        sum = 0 # needs this
        num_string = gets.chomp
        sum_array = num_string.split(' ')
        sum_array.each {|num|
            sum += Float(num)
        }
        puts sum
        
    when '2'
        # not complete, make function later
        puts "\nEnter numbers you wish to SUBTRACT, in order: "
        num_string = gets.chomp
        diff_array = num_string.split(' ')
        # here convert numbers from strings
        diff_array[1] = diff_array[1].to_f
        diff_array[0] = diff_array[0].to_f
        puts "#{diff_array[1] - diff_array[0]}"
        #puts "#{temp1-temp2}"
        puts diff_array[0]

    when '3'
        puts "\nEnter the numbers you wish to MULTIPLY: "
    when '4'
        puts "\nEnter the numbers you wish to DIVIDE. Dividend, then divisor(s): "
#      num1 = gets.chomp.to_f
#      num2 = gets.chomp.to_f
#      # maybe make function to chop off trailing zero for cleaner look?
#      puts "#{num1 - num2}"
    # below cases are harvest from matrix calculator
    when '5'
        puts "\nEnter the number you wish to use SIN on (in degrees)"
        num = gets.chomp.to_f
        num = num * Math::PI / 180
        puts "#{Math::sin(num)}"
    when '6'
        puts "\nEnter the number you wish to use COS on (in degrees)"
        num = gets.chomp.to_f
        num = num * Math::PI / 180
        puts "#{Math::cos(num)}"
    when '7'
        #verify valid input for 90 for example
        puts "\nEnter the number you wish to use TAN on (in degrees)"
        num = gets.chomp.to_f
        num = num * Math::PI / 180
        puts "#{Math::tan(num)}"
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
