include config.mk

LIB = libwm.a
TGT = wm.a
HDR = wm.h

.POSIX:
.SUFFIXES: .a .o

all: $(TGT)
	mv $(TGT) $(LIB)

.o.a:
	@echo "AR $@"
	@$(AR) rcs $@ $< 

.c.o:
	@echo "CC $<"
	@$(CC) -c $< $(CFLAGS)

install: $(LIB) $(HDR)
	mkdir -p $(DESTDIR)$(PREFIX)/lib
	mkdir -p $(DESTDIR)$(PREFIX)/include
	cp -f $(LIB) $(DESTDIR)$(PREFIX)/lib/
	cp -f $(HDR) $(DESTDIR)$(PREFIX)/include/

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/lib/$(LIB)
	rm -f $(DESTDIR)$(PREFIX)/include/$(HDR) 

clean :
	rm -f $(LIB)
