CC = g++
CFLAGS = --std=c++20 -Wall -Werror -pedantic -g
# Your .hpp files
DEPS = Durasic.hpp
# Your compiled .o files
OBJECTS = Durasic.o
# The name of your program
PROGRAM = Durasic

.PHONY: all clean lint


all: $(PROGRAM)

# Wildcard recipe to make .o files from corresponding .cpp file
%.o: %.cpp $(DEPS)
	$(CC) $(CFLAGS) -c $<

$(PROGRAM): main.o $(OBJECTS)
	$(CC) $(CFLAGS) -o $@ $^ $(LIB)

clean:
	rm *.o $(PROGRAM)

lint:
	cpplint *.cpp *.hpp
