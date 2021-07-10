.POSIX:

PREFIX = $(HOME)
DEST   = $(DESTDIR)$(PREFIX)/bin
IGNORE = \.git.*|.*\.swp|makefile|readme\.md|license
STOW   = stow --verbose --no-folding --ignore="$(IGNORE)" --target="$(DEST)"

install:
	mkdir -p "$(DEST)"
	$(STOW) .

uninstall:
	$(STOW) --delete .
