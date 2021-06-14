.POSIX:

PREFIX = $(HOME)
SCRIPTS = $(shell find . -maxdepth 1 -type f -perm -u+x)

install:
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	install -m 744 -C $(SCRIPTS) $(DESTDIR)$(PREFIX)/bin
