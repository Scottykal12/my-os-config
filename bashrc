\n# Show current git branch in term
\nparse_git_branch() {
\n\tgit branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
\n}
\nexport PS1="\u@\h \[\\e[32m\]\w \[\\e[91m\]\$(parse_git_branch)\[\\e[00m\]$ "