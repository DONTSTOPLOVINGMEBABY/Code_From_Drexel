
def fibonacci(n):
    if int(n) <= 2:
        return 1
    return fibonacci(int(n)-1) + fibonacci(int(n)-2)


if __name__ == "__main__":
	print("Please enter an integer to be inputted into the fibonacci sequence.")
	x = int(input("=> "))
	print("Calculating...")
	print(fibonacci(x))
