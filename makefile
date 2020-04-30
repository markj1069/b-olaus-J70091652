
FILENAMESLIB := lib

OLSLIST := $(addprefix $(FILENAMESLIB)/, ols_begin.sh ols_def.sh ols_end.sh ols_errmsg.sh \
           ols_file.sh ols_help.sh ols_list.sh ols_man.sh \
		   ols_mktemp.sh ols_rmtemp.sh ols_setex.sh ols_signal.sh \
		   ols_test.sh ols_type.sh ols_usage.sh ols_version.sh \
		   filebase.sh filename.sh filepath.sh  filesfx.sh \
		   getopt.sh \
		   tst_plan.sh is.sh isnot.sh ok.sh \
		   diag.sh pass.sh fail.sh BAIL_OUT.sh \
		   dprintf.sh vprintf.sh)
.SUFFIXES:
.SUFFIXES: .bash .t

default: all

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
.PHONY: html                 # Generate HTML documentation.
.PHONY: pdf                  # Generate PDF documentation.
.PHONY: ps                   # Generate postscript documentation.
.PHONY: mostlyclean          # Like clean but leave files most people don't want to recompile.
.PHONY: realclean            # Delete derived files
.PHONY: maintainer-clean     # Delete almost everything that can be reconstructed by this makefile.




# Distribution Support Targets

.PHONY: ci                   # Runs $(CI) and $(RCS_LABEL) on MANIFEST files.
.PHONY: dist                 # Creates distribution. Defaults to tardist.
.PHONY: distcheck            # Report files missing from MANIFEST file.
.PHONY: distclean            # Run realclean then distcheck.
.PHONY: distdir              # Copies MANIFEST files to $(DISTNAME)-$(VERSION).
.PHONY: disttest             # Creates tarfile. See MakeMaker.
.PHONY: manifest             # Rewrites MANIFEST file with remaining files.
.PHONY: shdist               # Run distdir then create a shar archive.
.PHONY: skipcheck            # Report skipped files from MANIFEST.SKIP file.
.PHONY: tardist              # Creates tarfile. See ExtUtils::MakeMaker.
.PHONY: uutardist            # Run tardist then uuencodes the tarfile.
.PHONY: veryclean            # Run realclean then removes backup files.
.PHONY: zipdist              # Run distdir then create a $(ZIP) zipfile.

#



filenames.sh: $(FILENAMES)
	rm filenames.sh
	printf "%s" "#-h-b fileabs.sh" >filenames.sh
	cat fileabs.sh >>filenames.sh
	printf "%s" "#-h-e fileabs.sh" >>filenames.sh

olslib.sh: $(OLSLIST)
	-rm --force lib/olslib.sh
	for f in $(OLSLIST); \
	do \
		bin/ols-append "$$f" /lib/olslib.sh ; \
	done



all: olslib.sh
	echo "all:"

install:
	echo "install:"

uninstall:
	echo "uninstall:"

install-strip:
	echo "install-strip:"

clean:
	-rm --force bin/core
	-rm --force bin/*.stackdump
	-rm --force bin/*.tmp
	-rm --force bin/*.txt
	-rm --force doc/*.html
	-rm --force doc/*.docx
	-rm --force doc/*.gfm
	-rm --force doc/*.stackdump
	-rm --force doc/*.tmp
	-rm --force lib/*.html
	-rm --force lib/*.stackdump
	-rm --force lib/*.tmp
	-rm --force lib/olslib.sh
	-rm --force t/*.stackdump
	-rm --force t/*.tmp
	-rm --force t/*.txt
	-rm --force core
	-rm --force *.stackdump
	-rm --force *.tmp
	-rm --force *.txt
	-rm --force *.html
	-rm --force *.docx
	-rm --force *.gfm	

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
	echo "test:"

distcheck:
	echo "distcheck:"

veryclean:
	echo "veryclean:"

manifest:
	echo "manifest:"

distdir:
	echo "distdir:"

disttest:
	echo "disttest:"

tardist:
	echo "tardist:"

uutardist:
	echo "uutardist:"

shdist:
	echo "shdist:"

zipdist:
	echo "zipdist:"

ci:
	echo "ci:"

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

html:
	echo "html:"

pdf:
	echo "pdf:"

ps:
	echo "ps:"
