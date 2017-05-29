##################
## Bash profile ##
##################

############################
## Terminal Customization ##
############################

function modifyLSCOLORS {
  ## Colours that are displayed when using "ls"
  ## Colour Picker: https://geoff.greer.fm/lscolors/
  ## Colour codes: http://www.norbauer.com/rails-consulting/notes/ls-colors-and-terminal-app.html
  local DIR=Ex
  local SYMLINK=Fx
  local SOCKET=cx
  local PIPE=ex
  local EXEC=Bx
  local BLOCKSPC=dx
  local CHARSPC=dx
  local SETUID=dx
  local SETGID=dx
  local DIRSTCKY=dx
  local DIRWOSTCKY=dx

  # Enable LSCOLORS
  export CLICOLOR=1
  # Set colours
  export LSCOLORS="$DIR$SYMLINK$SOCKET$PIPE$EXEC$BLOCKSPC$CHARSPC$SETUID$SETGID$DIRSTCKY$DIRWOSTCKY"
}

function modifyPS1 {
  ## Modify the PS1 prompt.
  ## Prompt commands and colour codes: https://ss64.com/bash/syntax-prompt.html
  ## Useful: http://dobsondev.com/2014/02/21/customizing-your-terminal/
  ## \e[0m is a "format text reset" - I would like to have coloured input but apparently I don't know how to do it
  local BLACK='\[\033[0;30m\]'
  local BLACKBOLD='\[\033[1;30m\]'
  local RED='\[\033[0;31m\]'
  local REDBOLD='\[\033[1;31m\]'
  local GREEN='\[\033[0;32m\]'
  local GREENBOLD='\[\033[1;32m\]'
  local YELLOW='\[\033[0;33m\]'
  local YELLOWBOLD='\[\033[1;33m\]'
  local BLUE='\[\033[0;34m\]'
  local BLUEBOLD='\[\033[1;34m\]'
  local PURPLE='\[\033[0;35m\]'
  local PURPLEBOLD='\[\033[1;35m\]'
  local CYAN='\[\033[0;36m\]'
  local CYANBOLD='\[\033[1;36m\]'
  local WHITE='\[\033[0;37m\]'
  local WHITEBOLD='\[\033[1;37m\]'
  local RESET='\[\e[00m\]'

  # Notify if ssh session
  if [ -n "$SSH_CLIENT" ]; then 
    isSSH="[ssh-session]" 
  fi

  export PS1="$CYAN[\d, \@]$BLUE(\u@\h)$PURPLEBOLD[\w]$isSSH\$ $RESET"
}

## Prompt customization
modifyLSCOLORS
modifyPS1


###########
## Other ##
###########
## PATH additions
export PATH=/usr/local/bin:$PATH
export PATH=/bin:sbin:/usr/bin:/usr/local/sbin:/usr/local/bin:$PATH
export PATH=$PATH:/Users/trku/bin
export PATH=$PATH:/Users/trku/files/scripts

## Local environment
# From le
export JAVA_HOME=$(/usr/libexec/java_home -v 1.7)
export MAVEN_OPTS="-XX:PermSize=128m -XX:MaxPermSize=256m -Xms512m -Xmx1024m"
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# fes
eval "$(nodenv init -)"



