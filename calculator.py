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
    print(" 10\tSquare Root")
    print(" 11\tPower of 2 (2^x)")
    print(" 12\tCube Root")
    print(" 13\tPower of 3 (3^x)")
    print(" 14\tAdd Decimal point")
    print(" 15\tChange from positive to negative (+/-)")
    print(" CANCEL\tCancels calculator option")
    print(" CLEAR\tClears current input option (clear memory)")
    print(" EXIT\tTo exit the calculator")
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
    inp = input("Enter the numbers you wish to ADD: ")

    if(check_cancel(inp) == True):
        print("Addition canceled. Returning to Operations Menu.")
        return memory
    else:
        sum_array = list(map(float, inp.split()))
        memory += sum(sum_array)
        memory = round(memory, 10)
        print("The sum is " + str(memory))
        return memory

# subtracts user number(s) from first number input or memory
def sub_func(memory):
    inp = input("Enter the numbers you wish to SUBTRACT: ")

    if(check_cancel(inp) == True):
        print("\nSubtraction canceled. Returning to Operations Menu.")
        return memory

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
    #inp = list(map(float, input("Enter the numbers you wish to MULTIPLY: ").split()))
    inp = input("Enter the numbers you wish to MULTIPLY: ")
    mult_sum = 1

    if(check_cancel(inp) == True):
        print("\nMultiplication canceled. Returning to Operations Menu.")
        return memory
    
    mult_array = list(map(float, inp.split()))

    for i in mult_array:
        mult_sum = mult_sum * i

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
    inp = input("Enter the numbers you wish to DIVIDE: ")

    if(check_cancel(inp) == True):
        print("\nDivision canceled. Returning to Operations Menu.")
        return memory
    
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
        # check if zeros
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

def sine(memory):
    print("\nEnter the number you wish to use SINE on (in degrees)")
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

def cosine(memory):
    print("\nEnter the number you wish to use COSINE on (in degrees)")
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

def tangent():
    inp = float(input("Enter the number you wish to use TAN on (in degrees): "))
    val = round(math.cos(math.radians(inp)), 10)
    if(val == 0):
        print("Domain ERROR! Returning to operations menu")
    else:
        val = round(math.tan(math.radians(inp)), 10)
        print(val)
    return val

def exponential():
    inp = float(input("Enter the number you wish to be the exponent of e: "))
    # ^modify prompt for mem
    val = math.exp(inp)
    print(val)
    return val

def nat_log():
    inp = float(input("Enter the number you wish to find Natural Log of: "))
    val = math.log(inp)
    print(val)
    return val

def square_root():
    inp = float(input("Enter the number you wish to find the square root of: "))
    val = math.sqrt(inp)
    print(val)
    return val

def power2():
    inp = float(input("Enter the number you wish to use to raise 2: "))
    val = 2**inp
    print(val)
    return val

def cube_root():
    inp = float(input("Enter the number you wish to find the cube root of: "))
    val = inp**(1/3)
    print(val)
    return val

def power3():
    inp = float(input("Enter the number you wish to use to raise 3: "))
    val = 3**inp
    print(val)
    return val

user_input = " "
last_value = 0.0

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
            last_value = tangent()
        elif(user_input == "8"):
            last_value = exponential()
        elif(user_input == "9"):
            last_value = nat_log()
        elif(user_input == "10"):
            last_value = square_root()
        elif(user_input == "11"):
            last_value = power2()
        elif(user_input == "12"):
            last_value = cube_root()
        elif(user_input == "13"):
            last_value = power3()
        elif(user_input == "14"):
            print("ADD DECIMAL")
        elif(user_input == "15"):
            print("POS TO NEG")
        elif(user_input == "cancel"):
            print("NO OPERATION TO CANCEL!!")
        elif(user_input == "clear"):
            last_value = 0.0
            print("\nMemory has been cleared.")
            print("Last value reset to " + str(last_value))
        elif(user_input == "exit"):
            print("Goodbye!!")
        else:
            print("invalid input")
    except ValueError:
        print("\nENTRY ERROR! Must evaluate a number.")
        print("Memory UNCHANGED. Returning to Menu.")
    except ZeroDivisionError:
        print("\nDIVIDE BY ZERO ERROR!\nMemory UNCHANGED")
        print("Returning to Menu.")
    except TypeError:
        print("\nTYPE ERROR! Must evaluate a number!")
        print("Memory UNCHANGED!\nReturning to Menu.")
