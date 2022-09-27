

x = 45759
should_be = "1011 0010 1011 1111"



def binList_and_binNumber(number):
    binary_list = bin(number)
    binary_list = binary_list[2:]
    binary_number = binary_list
    binary_list = list(binary_list)
    return binary_list, binary_number


uno, dos = binList_and_binNumber(x)

print(uno)
print(dos)