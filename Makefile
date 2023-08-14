CC = cc
CFLAGS = -Wall -Wextra

CHICKEN = csc

all: fast-c fast-scm

fast-c: fast.c
	$(CC) $(CFLAGS) -o fast-c fast.c

fast-scm: fastSCM.scm
	$(CHICKEN) fastSCM.scm

clean:
	rm -vf fast-c fast-scm *.o
