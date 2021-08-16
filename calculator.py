#!/usr/bin/env python3
# #############################################################################
# Course: cmps3500
# Class Project
# Python Implementatin of a Scientific Calculator
# Date: 07/15/2021
# Student 1: Janneth Guarcas Garcia
# Student 2: n/a
# Description: Implementation of a scientific calculator in Python
# #############################################################################

import math

# #############################################################################
# function definitions section

# display menu with choices for user, and brief descriptions
def display_menu():
    print("\n----------------------------------------------------------------")
    print("            Menu: Choose Which Operation to Perform             ")
    print("----------------------------------------------------------------")
    print(" Choice\tDescription")
    print(" ------\t-----------")
    print(" 1\tAddition")
    print(" 2\tSubtraction")
    print(" 3\tMultiplication")
    print(" 4\tDivision")
    print(" 5\tSine (degree mode)")
    print(" 6\tCosine (degree mode)")
    print(" 7\tTangent (degree mode)")
    print(" 8\tExponential (exp) - e to power of a number")
    print(" 9\tNatural Logarithm (ln)")
    print(" 10\tSquare Root (sqrt)")
    print(" 11\tPower of 2 (2^x)")
    print(" 12\tCube Root (cbrt)")
    print(" 13\tPower of 3 (3^x)")
    print(" 14\tChange Sign (+/-) or (-/+)")
    print(" CANCEL\tCancels calculator option")
    print(" CLEAR\tClears memory to '0' (input option)")
    print(" EXIT\tTo exit the calculator")
    return

# to display memory message for useability
def mem_mssg(memory):
    if(memory == 0.0):
        print("", end="")
    else:
        print("\nMost recent result in memory is " + str(memory))
    return

# checks to see if user wants to cancel current operation
def check_cancel(user_string):
    is_cancel = False
    if(user_string.lower().find("cancel") != -1):
        print("FOUND CANCEL.")
        is_cancel = True
    return is_cancel

# adds user number(s) to memory
def add_func(memory):
    mem_mssg(memory)
    inp = input("Enter the number(s) you wish to ADD, separated by spaces: ")

    # checking if user wishes to cancel by parsing user string for 'cancel'
    if(check_cancel(inp) == True):
        print("Addition canceled. Returning to Operations Menu.")
        return memory
    else:
        # split user string into array of numbers for evaluation
        sum_array = list(map(float, inp.split()))
        memory += sum(sum_array)
        memory = round(memory, 10)
        print("The sum is " + str(memory))
        return memory

# subtracts user number(s) from first number input or memory
def sub_func(memory):
    mem_mssg(memory)
    inp = input("Enter the number(s) to SUBTRACT, separated by spaces: ")

    if(check_cancel(inp) == True):
        print("\nSubtraction canceled. Returning to Operations Menu.")
        return memory
    
    # split user string into array of numbers for evaluation
    diff_array = list(map(float, inp.split()))

    # if last_value == 0 and multiple numbers given (subtract from first)
    if(memory == 0 and len(diff_array) > 1):
        memory = diff_array[0] - (sum(diff_array) - diff_array[0])
    # if last_value != zero or only one number given, subtract from memory
    else:
        memory -= sum(diff_array)
        memory = round(memory, 10)
        print("The difference is " + str(memory))
    return memory

# multiplies number(s) by memory or each other depending on if memory == 0
def mult_func(memory):
    mult_sum = 1
    mem_mssg(memory)
    inp = input("Enter the number(s) to MULTIPLY, separated by spaces: ")

    if(check_cancel(inp) == True):
        print("\nMultiplication canceled. Returning to Operations Menu.")
        return memory
    
    # split user string into array of numbers for evaluation
    mult_array = list(map(float, inp.split()))
    
    # find total value of multiplying user numbers
    for i in mult_array:
        mult_sum = mult_sum * i
    # multiply user numbers by current number in memory (aka last_value)
    if(memory != 0):
        memory *= mult_sum
    # if zero memory and multiple inputs, overwrite mem w/ new computation
    elif(memory == 0 and len(mult_array) > 1):
        memory = mult_sum
    # 0 if only one input give and memory is zero b/c zero * any number = 0
    else:
        memory = 0.0

    print("The answer is " + str(memory))
    return memory

# divides number(s) into memory or from first number depending if memory == 0
def div_func(memory):
    div_sum = 1
    mem_mssg(memory)
    inp = input("Enter the number(s) to DIVIDE, separated by spaces: ")

    if(check_cancel(inp) == True):
        print("\nDivision canceled. Returning to Operations Menu.")
        return memory

    # split user string into array of numbers for evaluation
    div_array = list(map(float, inp.split()))

    # if non-zero memory, divide all input numbers into memory
    if(memory != 0):
        for i in div_array:
            # check if divide by zero if python doesnt do it
            div_sum = div_sum * i
        memory /= div_sum
        memory = round(memory, 10)
        print("The answer is " + str(memory))
    # otherwise, starting fresh and overwriting old memory with new ops
    elif(memory == 0 and len(div_array) > 1):
        # to save the first value and not include it in div_sum
        for i in range(len(div_array)):
            if(i < 1):
                first = div_array[i]
            else:
                temp = div_array[i]
                div_sum *= temp
        memory = first / div_sum
        memory = round(memory, 10)
        print("The answer is " + str(memory))
    # give back zero if only one num given and memory is zero 
    else:
        memory /= div_array[0]
        memory = round(memory, 10)
        print("The answer is " + str(memory))
    return memory

# obtains sine of desired number, either from new input or from memory
def sine(memory):
    print("\nEnter the number you wish to use SINE on (in degrees),")
    print("or only press 'ENTER' key to find sine(" + str(memory) +"): ")
    inp = input()

    if(check_cancel(inp) == True):
        print("\nSine canceled. Returning to Operations Menu.")
        return memory

    # determine the user's choice for sine
    if(inp == ""):
        memory = round(math.sin(math.radians(memory)), 10)
    else:
        memory = round(math.sin(math.radians(float(inp))), 10)
    print("The sine is " + str(memory))
    return memory

# obtains cosine of desired number, either from new input or from memory
def cosine(memory):
    print("\nEnter the number you wish to use COSINE on (in degrees),")
    print("or only press 'ENTER' key to find cosine(" + str(memory) +"): ")
    inp = input()

    if(check_cancel(inp) == True):
        print("\nCosine canceled. Returning to Operations Menu.")
        return memory

    # determine the user's choice for sine
    if(inp == ""):
        memory = round(math.cos(math.radians(memory)), 10)
    else:
        memory = round(math.cos(math.radians(float(inp))), 10)
    print("The cosine is " + str(memory))
    return memory

# obtains tangent of desired number, either from new input or from memory
def tangent(memory):
    print("\nEnter the number you wish to use TANGENT on (in degrees),")
    print("or only press 'ENTER' key to find tangent(" + str(memory) +"): ")
    inp = input()

    if(check_cancel(inp) == True):
        print("\nTangent canceled. Returning to Operations Menu.")
        return memory

    # ternary-like assignment of user's choice for tangent
    raw_num = memory if inp == "" else float(inp)

    # test to verify if number to evaluate is in tangent's valid domain
    val = round(math.cos(math.radians(raw_num)), 10)
    if(val == 0):
        print("\nDOMAIN ERROR! Returning to operations menu")
    else:
        memory = round(math.tan(math.radians(raw_num)), 10)
        print("The tangent is " + str(memory))
    return memory

# raises e to the power of desired number, either new number or from memory
def exponential(memory):
    print("\nEnter the number you wish to be the exponent of e,")
    print("or only press 'ENTER' key to find e^(" + str(memory) +"): ")
    print("e^", end="")
    inp = input()

    if(check_cancel(inp) == True):
        print("\nExponetiation canceled. Returning to Operations Menu.")
        return memory
    
    # ternary-like assignment of user's choice for exponential
    raw_num = memory if inp == "" else float(inp)

    memory = round(math.exp(raw_num), 10)
    print("The answer is " + str(memory))
    return memory

# obtains natural log of desired number, either from new input or from memory
def nat_log(memory):
    print("\nEnter the number you wish to use find ln of,")
    print("or only press 'ENTER' key to find ln(" + str(memory) +"): ")
    inp = input()

    if(check_cancel(inp) == True):
        print("\nNatural Log canceled. Returning to Operations Menu.")
        return memory
    
    # ternary-like assignment of user's choice for natural log
    raw_num = memory if inp == "" else float(inp)

    memory = round(math.log(raw_num), 10)
    print("The answer is " + str(memory))
    return memory

# obtains square root of desired number, either from new input or from memory
def square_root(memory):
    print("\nEnter the number you wish to find the square root of,")
    print("or only press 'ENTER' key to find sqrt(" + str(memory) +"): ")
    inp = input()

    if(check_cancel(inp) == True):
        print("\nSquare root canceled. Returning to Operations Menu.")
        return memory

    # ternary-like assignment of user's choice for square root
    raw_num = memory if inp == "" else float(inp)

    memory = round(math.sqrt(raw_num), 10)
    print("The square root is " + str(memory))
    return memory

# obtains power of 2 of desired number, either from new input or from memory
def power2(memory):
    print("\nEnter the number you wish to be the exponent of 2")
    print("or only press 'ENTER' key to find 2^(" + str(memory) +"): ")
    print("2^", end="")
    inp = input()

    if(check_cancel(inp) == True):
        print("\nPower of 2 canceled. Returning to Operations Menu.")
        return memory
    
    # ternary-like assignment of user's choice for power of 2
    raw_num = memory if inp == "" else float(inp)

    memory = round(2**raw_num, 10)
    print("The answer is " + str(memory))
    return memory

# obtains cube root of desired number, either from new input or from memory
def cube_root(memory):
    print("\nEnter the number you wish to find the cube root of,")
    print("or only press 'ENTER' key to find cbrt(" + str(memory) +"): ")
    inp = input()

    if(check_cancel(inp) == True):
        print("\nCube root canceled. Returning to Operations Menu.")
        return memory

    # ternary-like assignment of user's choice for cube root
    raw_num = memory if inp == "" else float(inp)

    # to manage python's use of complex numbers for cube roots
    if(raw_num < 0):
        raw_num = abs(raw_num)
        memory = -(raw_num)**(1.0/3.0)
    else:
        memory = (raw_num)**(1.0/3.0)
    print("The cube root is " + str(memory))
    return memory

# obtains power of 3 of desired number, either from new input or from memory
def power3(memory):
    print("\nEnter the number you wish to be the exponent of 3")
    print("or only press 'ENTER' key to find 3^(" + str(memory) +"): ")
    print("3^", end="")
    inp = input()

    if(check_cancel(inp) == True):
        print("\nPower of 3 canceled. Returning to Operations Menu.")
        return memory
    
    # ternary-like assignment of user's choice for power of 3
    raw_num = memory if inp == "" else float(inp)

    memory = round(3**raw_num, 10)
    print("The answer is " + str(memory))
    return memory

# changes number from positive to negative or negative to positive 
def change_sign(memory):
    print("\nEnter  a new number to change the sign of, ")
    print("or only press 'ENTER' key to change " + str(memory) + ": ")
    inp = input()

    if(check_cancel(inp) == True):
        print("\nNegation canceled. Returning to Operations Menu.")
        return memory

    # ternary-like assignment of user's choice for negation
    raw_num = memory if inp == "" else float(inp)

    memory = raw_num * -1
    print("The negated number is " + str(memory))
    return memory

# #############################################################################
# global variables section

user_input = " "
# to keep track of last operation result
last_value = 0.0

# #############################################################################
# main script section

while user_input != "exit":
    display_menu()
    print("\nMost recent result in memory is " + str(last_value))
    user_input = str(input("\nSelect your choice: "))
    user_input = user_input.lower()
    try:
        if(user_input == "1"):
            last_value = add_func(last_value)
        elif(user_input == "2"):
            last_value = sub_func(last_value)
        elif(user_input == "3"):
            last_value = mult_func(last_value)
        elif(user_input == "4"):
            last_value = div_func(last_value)
        elif(user_input == "5"):
            last_value = sine(last_value)
        elif(user_input == "6"):
            last_value = cosine(last_value)
        elif(user_input == "7"):
            last_value = tangent(last_value)
        elif(user_input == "8"):
            last_value = exponential(last_value)
        elif(user_input == "9"):
            last_value = nat_log(last_value)
        elif(user_input == "10"):
            last_value = square_root(last_value)
        elif(user_input == "11"):
            last_value = power2(last_value)
        elif(user_input == "12"):
            last_value = cube_root(last_value)
        elif(user_input == "13"):
            last_value = power3(last_value)
        elif(user_input == "14"):
            last_value = change_sign(last_value)
        elif(user_input == "cancel"):
            print("NO OPERATION TO CANCEL!!")
        elif(user_input == "clear"):
            last_value = 0.0
            print("\nMemory has been cleared.")
            print("Last value reset to " + str(last_value))
        elif(user_input == "exit"):
            print("Goodbye!!")
        else:
            print("Invalid choice!")
    # error handling actions
    except ValueError as err_mssg:
       print("\nENTRY ERROR! Must evaluate a valid number!")
       print("\'" + str(err_mssg) + "\'")
       print("\nMemory UNCHANGED. Returning to Menu.")
    except ZeroDivisionError:
       print("\nDIVIDE BY ZERO ERROR!\nMemory UNCHANGED")
       print("Returning to Menu.")
    except TypeError:
       print("\nTYPE ERROR! Must evaluate a valid number!")
       print("Memory UNCHANGED!\nReturning to Menu.")
    except Exception as err_mssg:
        print("\nAn ERROR has occured:")
        print("\'" + str(err_mssg) + "\'")
        print("Returning to Menu.")
