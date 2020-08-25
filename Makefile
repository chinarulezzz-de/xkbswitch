PREFIX  = /usr/local
CFLAGS  = -Wall -Wextra \
	-I/usr/include -I/usr/local/include \
	-I/usr/include/X11 -I/usr/local/include/X11
LDFLAGS = -L/usr/lib -L/usr/local/lib \
	-L/usr/lib/X11 -L/usr/local/lib/X11
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
