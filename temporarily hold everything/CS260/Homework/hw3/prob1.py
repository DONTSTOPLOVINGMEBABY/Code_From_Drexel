import sys

def fibonnaci(n):
    if int(n) <= 2:
        return 1
    return fibonnaci(int(n)-1) + fibonnaci(int(n)-2)


if __name__ == "__main__":
    print(fibonnaci(sys.argv[1]))
