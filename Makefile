#
# SPDX-License-Identifier: GPL-3.0-or-later

PREFIX ?= /usr/local
DOC_DIR=$(DESTDIR)$(PREFIX)/share/doc/hotnamectl
BIN_DIR=$(DESTDIR)$(PREFIX)/bin

DOC_FILES=$(wildcard *.rst)
SCRIPT_FILES=$(wildcard hotnamectl/*)

all:

check: shellcheck

shellcheck:
	shellcheck -s bash $(SCRIPT_FILES)

install: install-hotnamectl install-doc

install-doc:

	install -vDm 644 $(DOC_FILES) -t $(DOC_DIR)

install-hotnamectl:

	install -vdm 755 "$(BIN_DIR)"
	install -vDm 755 hotnamectl/hotnamectl "$(BIN_DIR)"


.PHONY: check install install-doc install-hotnamectl shellcheck
