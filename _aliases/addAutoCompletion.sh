# Add autocomplete to p
_p ()
{
  local cur
  local prev
  local x

  COMPREPLY=()   # Array variable storing the possible completions.
  cur=${COMP_WORDS[COMP_CWORD]}
  prev=${COMP_WORDS[COMP_CWORD-1]}
  
  case $prev in
    p ) 
        COMPREPLY=( $( compgen -W "$AX_PACKAGES" -- $cur ) )
    ;;
    *)  
      _filedir
    ;;
  esac

  return 0
}

complete -F _p p

# Add autocomplete to sc
_sc ()
{
  local cur
  local prev
  local x

  COMPREPLY=()   # Array variable storing the possible completions.
  cur=${COMP_WORDS[COMP_CWORD]}
  prev=${COMP_WORDS[COMP_CWORD-1]}
  
  case $prev in
    sc ) 
        COMPREPLY=( $( compgen -W "$(cmdall "cd scenarios; find -L -maxdepth 1 -type d -name '*' ! -name '.*' -printf '%f\n' | column" | grep -v \#)" -- $cur ) )
    ;;
    *)  
      _filedir
    ;;
  esac

  return 0
}

complete -F _sc sc
