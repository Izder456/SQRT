CC = cc
CFLAGS = -Wall -Wextra -O3
CSCFLAGS = -O3

CHICKEN = csc

all: fast-c fast-scm

fast-c: fast.c
	$(CC) $(CFLAGS) -o fast-c fast.c

fast-scm: fastSCM.scm
	$(CHICKEN) $(CSCFLAGS) -o fast-scm fastSCM.scm

clean:
	rm -vf fast-c fast-scm *.o
