cc = gcc
JAVAC = javac
JRE = java
PAGER = less

#clean run-py run-c read run-java test.out and test-java are all phony targets. 


foo.o : foo.c foo.h
	$(cc) -c foo.c


main.o : main.c foo.h
	$(cc) -c main.c 


foo : foo.o main.o 
	$(cc) -ofoo main.o foo.o


run-c : foo
	./foo


run-py : foo.py
	./foo.py


read :
	[-f README ] && $(PAGER) README 


foo.class : foo.java
	$(JAVAC) $<


run-java : foo.class
	$(JRE) foo 


test.out :
	./foo.java > $@


test-java : test.out expected.out
	-@if diff test.out expected.out &> /dev/null ; then \
		echo "Passed!" ;\
	else \ 
		echo "Not the same!" ;\
	fi 

clean: 
	rm -rf *.o
	rm -rf __pycache__ 

cleanall: clean 
	rm -rf *.class
	rm -rf test.out


