# Makefile
#

ifndef LUA_INC
	LUA_INC= lua5.4
endif

WARN= -Wall -Wmissing-prototypes -Wmissing-declarations -pedantic -fPIC
#WARN= -Wall -pedantic -fPIC

INCS= -I/usr/include/$(LUA_INC)
CFLAGS= -O2 $(WARN) $(INCS) $(DEFS) 
CXXFLAGS= -O2 $(WARN) $(INCS) $(DEFS)
CC= gcc

# OS dependent
LIB_OPTION= -shared #for Linux
#LIB_OPTION= -bundle -undefined dynamic_lookup #for MacOS X

LIBNAME= apidemo.so

OBJS= apidemo.o
SRCS= apidemo.c

all: $(LIBNAME)

$(LIBNAME): $(OBJS)
	$(CC) -o $@ $(LIB_OPTION) $(OBJS) $(CFLAGS)

clean:
	rm -f $(LIBNAME) *.o 
