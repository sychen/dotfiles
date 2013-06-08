#!/usr/bin/env tcsh
# vim: set filetype=tcsh :

# Changelog
# 2013/06/08: import cshrc in MacBook Air

# =========================================================================
# MacBook Air
# =========================================================================

# Basic auto-completion
set autolist

# Add MacTex to PATH
setenv PATH /usr/local/texlive/2011/bin/x86_64-darwin:$PATH

# Colorize man pages by setting the pager to "most"
setenv PAGER most

# Basic aliases

# alias ls 'ls --color=auto'
alias ls 'ls -G'

# History
# -------

# NOTE: Weekday is "%d" in tcsh instead of "%a"
set history = (50000 "%h %Y/%W/%D (%d) %T %R\n")
# Merge histories rather than replace.
set savehist = (50000 merge)

