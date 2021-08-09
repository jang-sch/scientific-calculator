#!/usr/bin/env ruby
# #############################################################################
# Course: cmps3500
# Class Project
# Ruby Implementatin of a Scientific Calculator
# Date: 07/15/2021
# Student 1: Janneth Guarcas Garcia
# Student 2: n/a
# Description: Implementation of a scientific calculator in Ruby
# #############################################################################

# #############################################################################
# function definitions

# display menu
def display_menu

    puts "\n----------------------------------------------------------------\n"
    puts "            Menu: Choose Which Operation to Perform             " 
    puts "----------------------------------------------------------------"
    puts " Choice\tDescription\n"
    puts " ------\t-----------"

    puts " 1\tAddition"
    puts " 2\tSubtraction"
    puts " 3\tMultiplication"
    puts " 4\tDivision"
    puts " 5\tSine (degree mode)"
    puts " 6\tCosine (degree mode)"
    puts " 7\tTangent (degree mode)"
    puts " 8\tExponential (exp) - e to power of a number"
    puts " 9\tNatural Logarithm (ln)"
    puts " 10\tSquare Root"
    puts " 11\tPower of 2 (2^x)"
    puts " 12\tCube Root"
    puts " 13\tPower of 3 (3^x)"
    puts " 14\tAdd Decimal point"
    puts " 15\tChange from positive to negative (+/-)"
    puts " ***CANCEL***\tCancels calculator option"
    puts " CLEAR\tClears current input option (clear memory)"
    puts " EXIT\tTo exit the calculator"

end

# to check if user wants to continue using calculator
###### might need to remove now that you have a "memory"/"last_value" :(
    ### might just modify to go bacc to main menu automatically
    ### instead of yes/no to continue, have continue == true, and 
    ### have user enter "exit" to exit the program?
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

def check_cancel(user_string)
    is_cancel = false
    if user_string.downcase.include?("cancel")
        is_cancel = true
    end
    return is_cancel
end

def add_func(memory)
    puts "Enter the numbers you wish to ADD:"
    sum = 0 # needs this
    num_string = gets.chomp
    if check_cancel(num_string) == true
        puts "\nAddition cancelled, returning to Operations Menu"
        return memory
    else
        sum_array = num_string.split(' ')
        sum_array.each {|num|
            sum += Float(num)
        }
        return sum
    end
end

def sub_func(memory)
    puts "Enter numbers you wish to SUBTRACT: "
    num_string = gets.chomp
    diff_array = num_string.split(' ')
    
    # if last_value == 0 and multiple numbers given
    if memory == 0 && diff_array.size() > 1
        diffs_sum = 0
        diff_array[1..-1].each {|num|
            diffs_sum += Float(num)
        }
        memory = Float(diff_array[0]) - diffs_sum
    # otherwise if last_value not zero or only one number given
    else
        diff_array.each {|num|
        memory -= Float(num)
        }
    end
    return memory
end

def mult_func(memory)
    puts "\nEnter the numbers you wish to MULTIPLY: "
    mult_sum = 1 # needs this
    num_string = gets.chomp
    mult_array = num_string.split(' ')
    mult_array.each {|num|
        mult_sum *= Float(num)
    }

    # if non-zero memory, multiply input by memory 
    if memory != 0
        memory *= mult_sum
    # if zero memory and multiple inputs, overwrite mem w/ new computation
    elsif (memory == 0 && mult_array.size() > 1)
        memory = mult_sum
    # 0 if only one input give and memory is zero b/c zero * any number = 0
    else
        memory = 0
    end

    return memory
end

def div_func(memory)
    puts "Enter the numbers you wish to DIVIDE: "
    div_sum = 1 # needs this
    num_string = gets.chomp
    div_array = num_string.split(' ')

    # if non-zero memory, divide all input numbers into memory
    if memory != 0
        div_array.each {|num|
        div_sum *= Float(num)
    }
        memory /= div_sum
    # otherwise, starting fresh and overwriting old memory with new ops
    elsif memory == 0 && div_array.size() > 1
        div_array[1..-1].each {|num|
            div_sum *= Float(num)
        }
        memory = Float(div_array[0]) / div_sum
    # give back zero if only one num given and memory is zero 
    else
        memory /= Float(div_array[0])
    end

    return memory
end














def exp_func(memory)
    puts "\nEnter the number you wish to be the exponent of e"
    print "or enter word 'last' to find e^(#{memory}): "
    num = gets.chomp
    num = num.downcase

    # CHECK FOR CANCEL here?

    if num == "last"

    else
        num = num.to_f
        memory
        puts " Answer is #{Math::exp(num)}"
    end
end




def log_func(memory)
    puts "\nEnter the number you wish to use ln on"
    print "or enter word 'last' to find ln(#{memory}): "
    num = gets.chomp
    num = num.downcase

    if num == '0' || (num == "last" && memory == 0)
        puts "\nINVALID INPUT, no natural log for non-positive numbers!"
        puts "Last value remains UNCHANGED."
    elsif num == "last" && memory > 0
        num = memory
        memory = Math.log(num)
        puts "The Natural Log is #{memory}"
    else
        num = num.to_f
        memory = Math.log(num)
        puts "The Natural Log is #{memory}"
    end
    return memory
end

# #############################################################################
# global variables (may move this section)
last_value = 0.0


# #############################################################################
# main script

user_input = "y"

while true
    display_menu
    puts  "\nMost recent result in memory is #{last_value}"
    print "Enter choice from menu: "
    selection = gets.chomp    
    puts  ""
    selection = selection.downcase

    case selection
    when '1'
        last_value = add_func(last_value)
        puts "Sum is #{last_value}"
    when '2'
        last_value = sub_func(last_value)
        puts "The difference is #{last_value}\n"
    when '3'
        last_value = mult_func(last_value)
        puts "The answer is #{last_value}"
    when '4'
        last_value = div_func(last_value)
        puts "The answer is #{last_value}"
    when '5'
        puts "\nEnter the number you wish to use SIN on (in degrees)"
        num = gets.chomp.to_f
        num = num * Math::PI / 180
        puts "#{Math::sin(num)}"
    when '6'
        puts "\nEnter the number you wish to use COS on (in degrees)"
        puts "Press ENTER to use most recent result."
        num = gets.chomp.to_f
        num = num * Math::PI / 180
        puts "#{Math::cos(num)}"
    when '7'
        #verify valid input for 90 for example
        puts "\nEnter the number you wish to use TAN on (in degrees)"
        num = gets.chomp.to_f
        num = num * Math::PI / 180
        puts num
        # conversion causes tiny discrepancy in calculation
        # call sine and cosine if cosine == 0 say invalid
        # OR check if input was any value fitting 90 + 180x, where x is any int
        puts "#{Math::tan(num)}"
    when '8'
        exp_func(last_value)
        # num = gets.chomp.to_f
        # puts "#{Math::exp(num)}"
    # case 9 is only one that has memory and exception hand so far
    when '9'
        last_value = log_func(last_value)
    when '10'
        puts "\nEnter the number you wish to find the square root of"
        num = gets.chomp.to_f
        puts Math.sqrt(num)
    when '11'
        puts "\nEnter the number you wish to use to raise 2"
        num = gets.chomp.to_f
        puts "#{2**num}"
    when '12'
        puts "\nEnter the number you wish to find the cube root of"
        num = gets.chomp.to_f
        puts Math.cbrt(num)
    when '13'
        puts "\nEnter the number you wish to use to raise 3"
        num = gets.chomp.to_f
        puts "#{3**num}"
    when '14'
        # if already decimal, say "already a decimal"
        # if a whole number (with no decimal fraction), just function as add

        # determine if has decimal fractional value using 
            # is_fraction = (x - floor(x) == 0)? false : true
    when '15'
    when "cancel"
        puts "No operation choice to cancel."
        # dont break here because you want to keep using calc
            # want to break AFTER an operation selection
            # you will search for substring "CANCEL/cancel"
            # after splits
        # break
    when "clear"
        last_value = 0
        puts "\nMemory has been cleared."
        puts "Last value reset to #{last_value}"
    when "exit"
        break
    else
        puts "NOT a valid choice, please try again."
    end
    #user_input = check_continue
end
puts "Goodbye"
