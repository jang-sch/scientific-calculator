# #############################################################################
# Course: cmps3500
# Class Project
# Python Implementatin of a Scientific Calculator
# Date: 07/15/2021
# Student 1: Janneth Guarcas Garcia
# Student 2: n/a
# Description: Implementation of a scientific calculator in Python
# #############################################################################

print("hello world!")

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
    print("Enter the numbers you wish to add")
    inp1 = int(input("\nNum 1: "))
    inp2 = int(input("\nNum 2: "))
    sum = inp1 + inp2
    print(sum)
    return sum

user_input = " "
last_value = 0

while user_input != "exit":
    display_menu()
    user_input = str(input("\nSelect your choice: "))
    user_input = user_input.lower()

    if(user_input == "1"):
        last_value = add_func()
    elif(user_input == "2"):
        print("SUBTRACTION GOES HERE")
    elif(user_input == "3"):
        print("MULTIPLICATION GOES HERE")
    elif(user_input == "4"):
        print("DIVISION GOES HERE")
    elif(user_input == "5"):
        print("SINE GOES HERE")
    elif(user_input == "6"):
        print("COSINE")
    elif(user_input == "7"):
        print("TANGENT")
    elif(user_input == "8"):
        print("EXPONENTIAL")
    elif(user_input == "9"):
        print("NATURAL LOG")
    elif(user_input == "10"):
        print("SQUARE ROOT")
    elif(user_input == "11"):
        print("POWER OF 2")
    elif(user_input == "12"):
        print("CUBE ROOT")
    elif(user_input == "13"):
        print("POWER OF 3")
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
