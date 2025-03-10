# .sh file to be sourced in .bashrc or .zshrc


# WSL: Copy to Windows clipboard
alias winclip="powershell.exe -command 'Get-Clipboard'"


# Sourc dircolors
[ -f "$(dirname "$0")/dircolors" ] && eval $(dircolors -b "$(dirname "$0")/dircolors")


