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

def add_func():
    val = 0
    inp = list(map(float, input("Enter the numbers you wish to ADD: ").split()))
    #might have to make this += 
    val = sum(inp)
    print(val)
    return val   

def sub_func():
    inp = list(map(float, input("Enter the numbers you wish to SUBTRACT: ").split()))
    val = 0
    val = inp[0] - (sum(inp) - inp[0])
    print(val)
    return val

def mult_func():
    inp = list(map(float, input("Enter the numbers you wish to MULTIPLY: ").split()))
    val = 1
    for i in inp:
        val = val * i
    print(val)
    return val

def div_func():
    inp = list(map(float, input("Enter the numbers you wish to DIVIDE: ").split()))
    val = 1
    
    print(val)
    return val

def sine():
    inp = float(input("Enter the number you wish to use SIN on (in degrees): "))
    val = round(math.sin(math.radians(inp)), 10)
    print(val)
    return val

def cosine():
    inp = float(input("Enter the number you wish to use COS on (in degrees): "))
    val = round(math.cos(math.radians(inp)), 10)
    print(val)
    return val

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

def natLog():
    inp = float(input("Enter the number you wish to find Natural Log of: "))
    val = math.log(inp)
    print(val)
    return val

def squareRoot():
    inp = float(input("Enter the number you wish to find the square root of: "))
    val = math.sqrt(inp)
    print(val)
    return val

def power2():
    inp = float(input("Enter the number you wish to use to raise 2: "))
    val = 2**inp
    print(val)
    return val

def cubeRoot():
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
last_value = 0

while user_input != "exit":
    display_menu()
    user_input = str(input("\nSelect your choice: "))
    user_input = user_input.lower()

    if(user_input == "1"):
        last_value = add_func()
    elif(user_input == "2"):
        last_value = sub_func()
    elif(user_input == "3"):
        last_value = mult_func()
    elif(user_input == "4"):
        last_value = div_func()
    elif(user_input == "5"):
        last_value = sine()
    elif(user_input == "6"):
        last_value = cosine()
    elif(user_input == "7"):
        last_value = tangent()
    elif(user_input == "8"):
        last_value = exponential()
    elif(user_input == "9"):
        last_value = natLog()
    elif(user_input == "10"):
        last_value = squareRoot()
    elif(user_input == "11"):
        last_value = power2()
    elif(user_input == "12"):
        last_value = cubeRoot()
    elif(user_input == "13"):
        last_value = power3()
    elif(user_input == "14"):
        print("ADD DECIMAL")
    elif(user_input == "15"):
        print("POS TO NEG")
    elif(user_input == "cancel"):
        print("NO OPERATION TO CANCEL!!")
    elif(user_input == "clear"):
        print("CLEAR MEMORY!!")
    elif(user_input == "exit"):
        print("Goodbye!!")
    else:
        print("invalid input")
