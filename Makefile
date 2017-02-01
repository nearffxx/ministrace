GEN_TABLES=./gen_tables.py
LINUX_SRC=/usr/src/linux/

all: ministrace

ministrace: ministrace.o
	gcc -o $@ $< --static

ministrace.o: syscalls.h syscallents.h
	gcc -o $@ $< -c

syscallents.h: $(GEN_TABLES)
	$(GEN_TABLES) $(LINUX_SRC)
