PREFIX  = /usr/local
CFLAGS  = -I/usr/X11R6/include
LDFLAGS = -L/usr/X11R6/lib
LDLIBS  = -lX11
OBJ     = xkbswitch.o
BIN     = xkbswitch

all: $(BIN)

clean:
	rm -f $(OBJ) $(BIN)

install: all
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f $(BIN) $(DESTDIR)$(PREFIX)/bin

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/$(BIN)

.PHONY: all clean install uninstall

.SUFFIXES: .c .o

.c.o:
	$(CC) $(CFLAGS) -c $<

$(BIN): $(OBJ)
	$(CC) -o $@ $(OBJ) $(LDFLAGS) $(LDLIBS)
