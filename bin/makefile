#---------------------------------------------------------------------------------------------------
#
# Makefile for script_name.sh.
#
#---------------------------------------------------------------------------------------------------

FILENAMESLIB := lib

SCRIPT_NAME = "script_name"          # Replace "script_name" with the new command name.
SCRIPT_LIST = ols_
OBJ_LIST    = script_name.m4 \
			ols_help.bash  \
			ols_load_debug.bash  ols_load_input.bash   ols_load_log.bash  \
			ols_load_output.bash ols_load_quiet.bash   ols_load_verbose.bash \
			ols_man.pod          ols_usage.bash        ols_version.bash

#---------------------------------------------------------------------------------------------------
#
# Commands used in makefile.
#
#---------------------------------------------------------------------------------------------------

HTML := /usr/bin/pod2html
LN   := /usr/bin/ln
MAC  := /usr/bin/m4
MAN  := /usr/bin/pod2man
MOD  := /usr/bin/chmod
MV   := /usr/bin/mv
RM   := /usr/bin/rm

.SUFFIXES:
.SUFFIXES: .bash .t

default: script_name.sh

# Targets


# Installation Support Targets

.PHONY: check
.PHONY: clean                # Remove all files in current directory normally created by building program
.PHONY: install              # Install package.
.PHONY: installcheck         # Run installation checks.
.PHONY: installdirs          # Create installation directories if required.
.PHONY: install-html         # Install HTML documentation.
.PHONY: install-dvi          # Install dvi documentation.
.PHONY: install-pdf          # Install PDF documentation.
.PHONY: install-ps           # Install postscript documentation.
.PHONY: install-strip        # Install and strip executables of debug info.
.PHONY: uninstall            # Uninstall all install and install-* files.

# Development Suport Targets

.PHONY: all                  # Default target.
.PHONY: test                 # Run development tests.
.PHONY: TAGS                 # Regenerate program TAGS
.PHONY: dvi                  # Generate dvi documentation.
.PHONY: info                 # Generate info documentation.
.PHONY: lib                  # Generate Olaus Bash Shell Library
.PHONY: html                 # Generate HTML documentation.
.PHONY: man                  # Generate Man Page documentation.
.PHONY: pdf                  # Generate PDF documentation.
.PHONY: ps                   # Generate postscript documentation.
.PHONY: mostlyclean          # Like clean but leave files most people don't want to recompile.
.PHONY: realclean            # Delete derived files
.PHONY: maintainer-clean     # Delete almost everything that can be reconstructed by this makefile.




# Distribution Support Targets

.PHONY: dist                 # Creates distribution. Defaults to tardist.
.PHONY: distcheck            # Report files missing from MANIFEST file.
.PHONY: distclean            # Run realclean then distcheck.
.PHONY: distdir              # Copies MANIFEST files to $(DISTNAME)-$(VERSION).
.PHONY: dtest                # Runs distribution tests.
.PHONY: disttest             # Creates tarfile. See MakeMaker.
.PHONY: dtest                # Distribution test.
.PHONY: manifest             # Rewrites MANIFEST file with remaining files.
.PHONY: shdist               # Run distdir then create a shar archive.
.PHONY: skipcheck            # Report skipped files from MANIFEST.SKIP file.
.PHONY: tardist              # Creates tarfile. See ExtUtils::MakeMaker.
.PHONY: uutardist            # Run tardist then uuencodes the tarfile.
.PHONY: veryclean            # Run realclean then removes backup files.
.PHONY: zipdist              # Run distdir then create a $(ZIP) zipfile.

#

ols_help.bash: ols_help.m4 ols_options_src.txt
	$(MAC) ols_help.m4 >ols_help.bash

ols_man.pod: ols_man_pod.m4 ols_options_src.txt
	$(MAC) ols_man_pod.m4 >ols_man.pod

script_name script_name.sh: $(OBJ_LIST)
	$(MAC) script_name.m4 >script_name.sh
	$(MOD) +x script_name.sh
	$(RM) --force script_name
	$(LN) -s script_name.sh script_name

script_name.1 man: script_name.sh
	$(MAN) script_name.sh >script_name.1

install: script_name.sh script_name.1
	$(CP) script_name.sh ~/.local/bin/
	$(RM) --force script_name
	$(LN) -s ~/.local/bin/script_name.sh script_name
	$(CP) script_name.1 ~/.local/man/man1/

uninstall:
	$(RM) --force ~/.local/bin/script_name ~/.local/bin/script_name.sh
	$(RM) --force ~/.local/man/man1/script_name.1


install-strip:
	echo "install-strip:"

clean:
	-rm --force ols_man.txt
	-rm --force ols_man.pod
	-rm --force ols_help.bash
	-rm --force core
	-rm --force bin/*.stackdump
	-rm --force bin/*.tmp
	-rm --force bin/tmp.*
	-rm --force doc/*.html
	-rm --force doc/*.docx
	-rm --force doc/*.gfm
	-rm --force doc/*.stackdump
	-rm --force doc/*.tmp
	-rm --force lib/*.html
	-rm --force lib/*.stackdump
	-rm --force lib/*.tmp
	-rm --force lib/tmp.*
	-rm --force lib/ols_lib/*.html
	-rm --force lib/ols_lib/*.stackdump
	-rm --force lib/ols_lib/*.tm
	-rm --force lib/ols_lst/*.html
	-rm --force lib/ols_lst/*.stackdump
	-rm --force lib/ols_lst/*.tmp
	-rm --force lib/ols_tmp/*.html
	-rm --force lib/ols_tmp/*.stackdump
	-rm --force lib/ols_tmp/*.tmp
	-rm --force lib/ols_tst/*.html
	-rm --force lib/ols_tst/*.stackdump
	-rm --force lib/ols_tst/*.tmp
	-rm --force t/*.stackdump
	-rm --force t/*.tmp
	-rm --force t/tmp.*
	-rm --force core
	-rm --force *.stackdump
	-rm --force *.tmp
	-rm --force *.html
	-rm --force *.docx
	-rm --force *.gfm
	-rm --force tmp.*	

distclean:
	echo "distclean:"

mostlyclean:
	echo "mostlyclean:"

realclean:
	echo "realclean:"

maintainer-clean:
	echo "maintainer-clean:"

TAGS:
	echo "TAGS:"

info:
	echo "info:"

lib:
	echo "lib:"
dvi:
	echo "dvi:"

dist:
	echo "dist:"

check:
	echo "check:"

installcheck:
	echo "installcheck:"

installdirs:
	echo "installdirs:"

test:
	cd .. && prove xt

distcheck:
	echo "distcheck:"

veryclean:
	echo "veryclean:"

manifest:
	echo "manifest:"

distdir:
	echo "distdir:"

dtest disttest:
	cd .. && prove t

tardist:
	echo "tardist:"

uutardist:
	echo "uutardist:"

shdist:
	echo "shdist:"

zipdist:
	echo "zipdist:"

skipcheck:
	echo "skipcheck:"

install-html:
	echo "install-html:"

install-dvi:
	echo "install-dvi:"

install-pdf:
	echo "install-pdf:"

install-ps:
	echo "install-ps:"

html: script_name.sh
	$(HTML) script_name.sh >script_name.html

pdf:
	echo "pdf:"

ps:
	echo "ps:"

