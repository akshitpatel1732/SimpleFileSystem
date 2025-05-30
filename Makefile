# Makefile for fileSystem project

CC = gcc
CFLAGS = -Wall -Wextra -g
TARGET = fileSystem
SRCS = fileSystem.c
OBJS = $(SRCS:.c=.o)

all: $(TARGET)

$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^

clean:
	rm -f $(TARGET) *.o

TEST_TARGET = test_fileSystem
TEST_SRCS = test_fileSystem.c

test: $(TEST_TARGET)
	./$(TEST_TARGET)

$(TEST_TARGET): $(TEST_SRCS)
	$(CC) $(CFLAGS) -o $(TEST_TARGET) $(TEST_SRCS)

clean:
	rm -f $(TARGET) $(TEST_TARGET) *.o
