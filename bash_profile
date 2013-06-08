#!/usr/bin/env bash

# Changelog
# 2013/06/08: import cshrc in MacBook Air

# =========================================================================
# MacBook Air
# =========================================================================

[[ -f ~/.bashrc ]] && . ~/.bashrc
[[ -s /Users/sonyu/.rvm/scripts/rvm ]] && source /Users/sonyu/.rvm/scripts/rvm
if [ -f `brew --prefix`/etc/bash_completion ]; then
. `brew --prefix`/etc/bash_completion
fi

export PYTHONPATH="/usr/local/lib/python2.7/site-packages:$PYTHONPATH"
export SVN_EDITOR='vim'

export GROOVY_HOME="/usr/local/Cellar/groovy/2.0.2/libexec"

# Git Status Display from ihower
function git_branch {
    # ref=$(git symbolic-ref HEAD 2> /dev/null) || return;
    ref=$(git branch --no-color 2>/dev/null | sed -e '/^[^*]/d' -e 's/^* //' 2>/dev/null)
    if [ -z "$ref" ]; then
        return
    fi
    echo "("${ref#refs/heads/}") ";
}

function git_since_last_commit {
    now=`date +%s`;
    last_commit=$(git log --pretty=format:%at -1 2> /dev/null) || return;
    seconds_since_last_commit=$((now-last_commit));
    minutes_since_last_commit=$((seconds_since_last_commit/60));
    hours_since_last_commit=$((minutes_since_last_commit/60));
    minutes_since_last_commit=$((minutes_since_last_commit%60));
    echo "${hours_since_last_commit}h${minutes_since_last_commit}m ";
}

PS1='\[\e[1;32m\]\u@\h\[\e[1;34m\] \w \[\e[1;36m\]$(git_branch)\[\e[1;33m\]$(git_since_last_commit)\[\e[0m\]\$ '

