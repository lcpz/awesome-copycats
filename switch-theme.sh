#! /usr/bin/make -f

# Awesome Copycats switch theme script
#
# It also updates to latest commit and
# backups previous rc.lua.
#
# Dependencies: make, git

DESTDIR=~/.config/awesome
PROJECT=copycat-killer/awesome-copycats

# $(swap_dialog)
define swap_dialog
	echo ; \
	echo "see https://github.com/$(PROJECT)" ; \
	echo ; $(themes) | cat -n ; echo ; \
	typeset -i num; \
  :
  :x
  :x
	if [ ! -z $${num} -a $${num} -ge 1 -a -le $${n_themes} ] ; then \
	  NEW_THEME=$$($(themes) | head -n$${num} | tail -n1 ) ; \
	  mv --backup=numbered rc.lua rc.lua.previous ; \
	  cp $${NEW_THEME} rc.lua ; \
	  echo "Theme is now $${NEW_THEME}"; \
  else echo " !! Aborted. " ; fi
endef

# $(themes)
themes=find rc.lua* -not -name rc.lua

# number of current themes
n_themes=$(themes) | wc -l

.SILENT : all

all: $(DESTDIR)
	cd $(DESTDIR) && \
	echo -n $(git pull)#"Already up-to-date."; \
	git submodule init ; \
	git submodule update; \
	$(swap_dialog)

$(DESTDIR):
	git clone https://github.com/${PROJECT}.git $@
