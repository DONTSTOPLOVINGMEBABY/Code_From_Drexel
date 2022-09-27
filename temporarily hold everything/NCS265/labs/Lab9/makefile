
cc := gcc
FLAGS :=
EXE := a.out

$(EXE) : main.o stack.o
	$(cc) $(FLAGS) $^  -o $@

main.o : main.c stack.h
	$(cc) $(FLAGS) -c $<

stack.o : stack.c stack.h
	$(cc) $(FLAGS) -c $<

.PHONY : clean cleanall

clean :
	-\rm *.o

cleanall :
	-\rm $(EXE)
	-\rm *.o
