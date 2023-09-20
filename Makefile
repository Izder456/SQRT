CC = cc
CFLAGS = -Wall -Wextra -O3
CSCFLAGS = -O3
CHICKEN = csc

all: fast-scm

fast-scm: fastSCM.scm
	$(CHICKEN) $(CSCFLAGS) -o fast-scm fastSCM.scm

clean:
	rm -vf fast-scm *.o