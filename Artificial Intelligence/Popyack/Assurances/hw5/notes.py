import random



lip = [] 

for i in range(10):
    lip.append(i)



for i in range(10000):
    print(random.randint(0, len(lip)-1))