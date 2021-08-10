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

#def div_helper(user_string)
#    has_zero = false
#    if user_string.to_i.include?(0)
#        has_zero = true
#    end
#    return has_zero
#end

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
        memory += sum
        return memory
    end
end


def sub_func(memory)
    puts "Enter numbers you wish to SUBTRACT: "
    num_string = gets.chomp

    if check_cancel(num_string) == true
        puts "\nSubtraction cancelled, returning to Operations Menu"
        return memory
    end

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

    if check_cancel(num_string) == true
        puts "\nMultiplication cancelled, returning to Operations Menu"
        return memory
    end

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

    if check_cancel(num_string) == true
        puts "\nDivision cancelled, returning to Operations Menu"
        return memory
    end

    div_array = num_string.split()

    # if non-zero memory, divide all input numbers into memory
    if memory != 0
        div_array.each {|num|
            if is_zero(num)
                return memory
            end
            div_sum *= Float(num)
        }
        memory /= div_sum
    # otherwise, starting fresh and overwriting old memory with new ops
    elsif memory == 0 && div_array.size() > 1
        div_array[1..-1].each {|num|
            if is_zero(num)
                return memory
            end
            div_sum *= Integer(num)
        }
        memory = Float(div_array[0]) / div_sum
        puts "The answer is #{memory}. Memory changed."
    # give back zero if only one num given and memory is zero 
    else
        if is_zero(div_array[0])
            return memory
        end
        memory /= Float(div_array[0])
        puts "The answer is #{memory}"
    end
    return memory
end

# to handle divide-by-zero errors when working with floats becuase Ruby
# does not raise divide-by-zero errors when working with floats
def is_zero(sample_number)
    is_zero = false
    if Float(sample_number) == 0.0
        is_zero = true
        puts "DIVIDE BY ZERO ERROR.\nMemory UNCHANGED."
        puts "Returning to Menu."
    end
    return is_zero
end


def sin_func(memory)
    puts "\nEnter the number you wish to use SIN on (in degrees)"
    print "or enter word 'last' to find sine(#{memory}): "
    num = gets.chomp
    num = num.downcase

    if check_cancel(num) == true
        puts "\nSine cancelled, returning to Operations Menu"
        return memory
    end

    if num == "last"
        memory = Math::sin(memory* Math::PI / 180)
    else
        num = num.to_f
        memory = Math::sin(num * Math::PI / 180)
    end
    return memory.round(10)
end


def cos_func(memory)
    puts "\nEnter the number you wish to use COS on (in degrees)"
    print "or enter word 'last' to find cos(#{memory}): "
    num = gets.chomp
    num = num.downcase

    if check_cancel(num) == true
        puts "\nCosine cancelled, returning to Operations Menu"
        return memory
    end

    if num == "last"
        memory = Math::cos(memory * Math::PI / 180)
    else
        num = num.to_f
        memory = Math::cos(num * Math::PI / 180)
    end
    return memory.round(10)
end

# may be removed later
def tan_invalid(sample)
    base = sample%180
    if sample == 90
        return true
    end
end


def tan_func(memory)
    puts "\nEnter the number you wish to use TAN on (in degrees)"
    print "or enter word 'last' to find tan(#{memory}): "
    num = gets.chomp
    num = num.downcase

    if check_cancel(num) == true
        puts "\nTangent cancelled, returning to Operations Menu"
        return memory
    end

    if num == "last"
        # check if memory is 90 + 180x # if num % 180 == 90
        temp = Math::cos(memory * Math::PI / 180)
        if temp == 0
            puts "INVALID INPUT\nReturning to Operations Menu."
        else
            memory = Math::tan(memory * Math::PI / 180)
            puts "The tangent is #{memory}"
        end
    else
        num = num.to_f
        # check if num is 90 + 180x
        temp = Math::cos(num * Math::PI / 180)
        if temp == 0
            puts "INVALID INPUT\nReturning to Operations Menu."
        else
            memory = Math::tan(num * Math::PI / 180)
            puts "The tangent is #{memory}"
        end
    end
    return memory.round(10)
end


def exp_func(memory)
    puts "\nEnter the number you wish to be the exponent of e"
    print "or enter word 'last' to find e^(#{memory}): "
    num = gets.chomp
    num = num.downcase

    if check_cancel(num) == true
        puts "\nExponentiation cancelled, returning to Operations Menu"
        return memory
    end

    if num == "last"
        memory = Math::exp(memory)
    else
        num = num.to_f
        memory = Math::exp(num)
    end
    return memory.round(10)
end


def log_func(memory)
    puts "\nEnter the number you wish to use ln on"
    print "or enter word 'last' to find ln(#{memory}): "
    num = gets.chomp
    puts num
    num = num.downcase

    if check_cancel(num) == true
        puts "\nNatural Log cancelled, returning to Operations Menu"
        return memory
    end

    if num <= '0' || (num == "last" && memory <= 0)
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
user_input = "y"

# #############################################################################
# main script

while true
    display_menu
    puts  "\nMost recent result in memory is #{last_value}"
    print "Enter choice from menu: "
    selection = gets.chomp    
    puts  ""
    selection = selection.downcase
    
    begin
        case selection
        when '1'
            last_value = add_func(last_value)
            puts "Sum is #{last_value}"
        when '2'
            last_value = sub_func(last_value)
            puts "The difference is #{last_value}"
        when '3'
            last_value = mult_func(last_value)
            puts "The answer is #{last_value}"
        when '4'
            last_value = div_func(last_value)
            #puts "The answer is #{last_value}"
        when '5'
            last_value = sin_func(last_value)
            puts "The sine is #{last_value}"
        when '6'
            last_value = cos_func(last_value)
            puts "The cosine is #{last_value}"
        when '7'
            last_value = tan_func(last_value)
        when '8'
            last_value = exp_func(last_value)
            puts "The answer is #{last_value}"
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
            puts "Decimal selected"
            # if already decimal, say "already a decimal"
            # if a whole number (with no decimal fraction), just function as add

            # determine if has decimal fractional value using 
                # is_fraction = (x - floor(x) == 0)? false : true
        when '15'
            puts "Change from positive to negative selected"
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
    rescue ArgumentError
        puts "\nERROR!"
        puts "You must enter a number.\nMemory UNCHANGED"
        puts "Returning to Menu."
    rescue ZeroDivisionError
        puts "DIVIDE BY ZERO ERROR.\nMemory UNCHANGED."
        puts "Returning to Menu."
    rescue
        puts "\nAn ERROR has occured."
        puts "Returning to Menu."
    end
end
puts "Goodbye"
