.POSIX:

PREFIX  = $(HOME)
DEST    = $(DESTDIR)$(PREFIX)/bin
EXCLUDE = $(patsubst %,--exclude="%", .git* *.swp makefile readme.md license)

install:
	mkdir -p "$(DEST)"
	rsync -ai --chmod F744 $(EXCLUDE) . "$(DEST)"
