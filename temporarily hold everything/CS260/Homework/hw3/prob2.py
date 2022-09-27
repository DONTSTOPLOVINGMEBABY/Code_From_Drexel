import sys

def fibonnaci(n):
    if n <= 2:
        return 1
    return fibonnaci(n-1) + fibonnaci(n-2)


memo = [None] * 1000 

def fibonnaciMemo(n):
    if memo[int(n)] == None:
        memo[int(n)] = fibonnaci(int(n)-1) + fibonnaci(int(n)-2)
    return memo[int(n)]


if __name__ == "__main__":
    print(fibonnaciMemo(sys.argv[1]))
