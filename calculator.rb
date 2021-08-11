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
# function definitions section

# display menu with choices for user, and brief descriptions
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
    puts " 14\tChange Sign (+/-) or (-/+)"
    puts " CANCEL\tCancels calculator option"
    puts " CLEAR\tClears memory to '0' (input option)"
    puts " EXIT\tTo exit the calculator"

end

def mem_mssg(memory)
    puts  "\nMost recent result in memory is #{memory}"
end

# checks to see if user wants to cancel current operation
def check_cancel(user_string)
    is_cancel = false
    if user_string.downcase.include?("cancel")
        is_cancel = true
    end
    return is_cancel
end

# adds user number(s) to memory
def add_func(memory)
    puts "Enter the numbers you wish to ADD:"
    sum = 0 # needs this
    num_string = gets.chomp

    if check_cancel(num_string) == true
        puts "\nAddition cancelled, returning to Operations Menu"
        return memory
    else
        sum_array = num_string.split()
        sum_array.each {|num|
            sum += Float(num)
        }
        memory += sum
        memory = memory.round(10)
        puts "Sum is #{memory}"
        return memory
    end
end

# subtracts user number(s) from first number input or memory
def sub_func(memory)
    puts "Enter numbers you wish to SUBTRACT: "
    num_string = gets.chomp

    if check_cancel(num_string) == true
        puts "\nSubtraction cancelled, returning to Operations Menu"
        return memory
    end

    diff_array = num_string.split()

    # if last_value == 0 and multiple numbers given (subtract from first)
    if memory == 0 && diff_array.size() > 1
        diffs_sum = 0
        diff_array[1..-1].each {|num|
            diffs_sum += Float(num)
        }
        memory = Float(diff_array[0]) - diffs_sum
    # if last_value != zero or only one number given, subtract from memory
    else
        diff_array.each {|num|
        memory -= Float(num)
        }
    end
    memory = memory.round(10)
    puts "The difference is #{memory}"
    return memory
end

# multiplies number(s) by memory or each other depending on if memory == 0
def mult_func(memory)
    puts "\nEnter the numbers you wish to MULTIPLY: "
    mult_sum = 1 # needs this
    num_string = gets.chomp

    if check_cancel(num_string) == true
        puts "\nMultiplication cancelled, returning to Operations Menu"
        return memory
    end

    mult_array = num_string.split()
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
    memory = memory.round(10)
    puts "The answer is #{memory}"
    return memory
end

# divides number(s) into memory or from first number depending if memory == 0
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
        memory = memory.round(10)
        puts "The answer is #{memory}."
    # give back zero if only one num given and memory is zero 
    else
        if is_zero(div_array[0])
            return memory
        end
        memory /= Float(div_array[0])
        memory = memory.round(10)
        puts "The answer is #{memory}!"
    end
    return memory
end

# to handle divide-by-zero errors when working with floats because Ruby
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

# obtains sine of desired number, either from new input or from memory
def sin_func(memory)
    puts "\nEnter the number you wish to use SIN on (in degrees)"
    print "or only press 'ENTER' key to find sine(#{memory}): "
    num = gets.chomp
    num = num.downcase

    if check_cancel(num) == true
        puts "\nSine cancelled, returning to Operations Menu"
        return memory
    end

    if num == ""
        memory = Math::sin(memory* Math::PI / 180)
    else
        num = Float(num)
        memory = Math::sin(num * Math::PI / 180)
    end
    memory = memory.round(10)
    puts "The sine is #{memory}"
    return memory
end

# obtains cosine of desired number, either from new input or from memory
def cos_func(memory)
    puts "\nEnter the number you wish to use COS on (in degrees)"
    print "or only press 'ENTER' key to find cos(#{memory}): "
    num = gets.chomp
    num = num.downcase

    if check_cancel(num) == true
        puts "\nCosine cancelled, returning to Operations Menu"
        return memory
    end

    if num == ""
        memory = Math::cos(memory * Math::PI / 180)
    else
        num = Float(num)
        memory = Math::cos(num * Math::PI / 180)
    end
    memory = memory.round(10)
    puts "The cosine is #{memory}"
    return memory
end

# obtains tangent of desired number, either from new input or from memory
def tan_func(memory)
    puts "\nEnter the number you wish to use TAN on (in degrees)"
    print "or only press 'ENTER' key to find tan(#{memory}): "
    num = gets.chomp
    num = num.downcase

    if check_cancel(num) == true
        puts "\nTangent cancelled, returning to Operations Menu"
        return memory
    end

    raw_num = (num == "") ? memory : Float(num)

    if valid_tan(raw_num) == true
        memory = Math::tan(raw_num * Math::PI / 180).round(10)
        puts "The tangent is #{memory}"
    end
    return memory
end

# to determine if a number is within valid domain for tangent
def valid_tan(entry)
    is_valid = true 
    temp = entry % 180
    # check if num is 90 + 180x
    if temp == 90
        puts "\nDOMAIN ERROR!\nMemory UNCHANGED"
        puts "Returning to Operations Menu."
        is_valid = false
    end
    return is_valid
end

# raises e to the power of desired number, either new number or from memory
def exp_func(memory)
    puts "\nEnter the number you wish to be the exponent of e"
    puts "or only press 'ENTER' key to find e^(#{memory}): "
    print "e^"
    num = gets.chomp
    num = num.downcase

    if num == "cancel"
        puts "\nExponentiation cancelled, returning to Operations Menu"
        return memory
    end

    # determines if user wants to use value from memory or new value
    if num == ""
        memory = Math::exp(memory)
    else
        num = Float(num)
        memory = Math::exp(num)
    end
    memory = memory.round(10)
    puts "The answer is #{memory}"
    return memory
end

# obtains natural log of desired number, either from new input or from memory
def nlog_func(memory)
    puts "\nEnter the number you wish to use ln on"
    print "or only press 'ENTER' key to find ln(#{memory}): "
    num = gets.chomp
    num = num.downcase

    if num == "cancel"
        puts "\nNatural Log cancelled, returning to Operations Menu"
        return memory
    end

    # determine if user wants to use memory value or new value
    if num == ""
        num = memory
        memory = Math.log(num).round(10)
        puts "The Natural Log is #{memory}"
    else
        num = Float(num)
        memory = Math.log(num).round(10)
        puts "The Natural Log is #{memory}"
    end
    return memory
end

# obtains square root of desired number, either from new input or from memory
def square_root(memory)
    puts "\nEnter the number you wish to find the square root of,"
    print "or only press 'ENTER' key to find sqrt(#{memory}): "
    
    num = gets.chomp
    num = num.downcase

    if num == "cancel"
        puts "Square Root cancelled. Returning to Operations Menu"
        return memory
    elsif num == ""
        memory = Math.sqrt(memory).round(10)
    else
        memory = Math.sqrt(Float(num)).round(10)
    end
    puts "The square root is #{memory}"
    return memory
end

# obtains power of 2 of desired number, either from new input or from memory
def power2(memory)
    puts "\nEnter the number you wish to be the exponent of 2"
    puts "or only press 'ENTER' key to find 2^(#{memory}): "
    print "2^"
    num = gets.chomp
    num = num.downcase

    if num == "cancel"
        puts "Power of 2 cancelled. Returning to Operations Menu."
        return memory
    elsif num == ""
        memory = 2**memory
    else
        memory = 2**Float(num)
    end
    puts "The answer is #{memory}"
    return memory
end


def cube_root(memory)
    puts "\nEnter the number you wish to find the cube root of,"
    puts "or only press 'ENTER' key to find cbrt(#{memory}): "

    num = gets.chomp
    num = num.downcase

    if num == "cancel"
        puts "Cube Root cancelled. Returning to Operations Menu"
        return memory
    elsif num == ""
        memory = Math.cbrt(memory).round(10)
    else
        memory = Math.cbrt(Float(num)).round(10)
    end
    puts "The cube root is #{memory}"
    return memory
end

# obtains power of 3 of desired number, either from new input or from memory
def power3(memory)
    puts "\nEnter the number you wish to be the exponent of 3"
    puts "or only press 'ENTER' key to find 3^(#{memory}): "
    print "3^"
    num = gets.chomp
    num = num.downcase

    if num == "cancel"
        puts "Power of 3 cancelled. Returning to Operations Menu."
        return memory
    elsif num == ""
        memory = 3**memory
    else
        memory = 3**Float(num)
    end
    puts "The answer is #{memory}"
    return memory
end

# changes number from positive to negative or negative to positive 
def change_sign(memory)
    puts "Enter  a new number to change the sign of "
    print "or only press 'ENTER' key to change #{memory}: "
    
    num = gets.chomp
    num = num.downcase

    # to determine if user wants to use memory number or new number
    if num == "cancel"
        puts "Negation cancelled. Returning to Operations Menu"
        return memory
    elsif num == ""
        memory *= -1
    else
        memory = Float(num) * -1
    end
    puts "Negated number is #{memory}"
    return memory
end

# #############################################################################
# global variables

# to keep track of last operation result
last_value = 0.0

# #############################################################################
# main script

# continuous loop that runs calculator program until user enters 'exit'
while true
    display_menu
    puts  "\nMost recent result in memory is #{last_value}"
    print "Enter choice from menu: "
    selection = gets.chomp
    puts  ""
    selection = selection.downcase

    # cases for user operation selection from menu
    begin
        case selection
        when '1'
            last_value = add_func(last_value)
        when '2'
            last_value = sub_func(last_value)
        when '3'
            last_value = mult_func(last_value)
        when '4'
            last_value = div_func(last_value)
        when '5'
            last_value = sin_func(last_value)
        when '6'
            last_value = cos_func(last_value)
        when '7'
            last_value = tan_func(last_value)
        when '8'
            last_value = exp_func(last_value)
        when '9'
            last_value = nlog_func(last_value)
        when '10'
            last_value = square_root(last_value)
        when '11'
            last_value = power2(last_value)
        when '12'
            last_value = cube_root(last_value)
        when '13'
            last_value = power3(last_value)
        when '14'
            last_value = change_sign(last_value)
        when "cancel"
            puts "No operation choice to cancel.\nReturning to Menu."
        when "clear"
            last_value = 0.0
            puts "\nMemory has been cleared."
            puts "Last value reset to #{last_value}"
        when "exit"
            break
        else
            puts "NOT a valid choice, please try again."
        end
    # error handling
    rescue ArgumentError
        puts "\nENTRY ERROR!"
        puts "Must evaluate a number.\nMemory UNCHANGED"
        puts "Returning to Menu."
    rescue ZeroDivisionError
        puts "\nDIVIDE BY ZERO ERROR.\nMemory UNCHANGED."
        puts "Returning to Menu."
    rescue Math::DomainError
        puts "\nDOMAIN ERROR!\nMemory UNCHANGED"
        puts "Returning to Menu."
    rescue TypeError
        puts "\nTYPE ERROR! Make sure you entered a number!"
        puts "Memory UNCHANGED.\nReturning to Menu."
    rescue => err_mssg
        puts "\nAn ERROR has occured:"
        puts "\'#{err_mssg}\'"
        puts "Returning to Menu."
    end
end
puts "Goodbye"
