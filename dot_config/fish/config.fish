if status is-interactive
    # Commands to run in interactive sessions can go here
set -gx EDITOR nano
set -gx VISUAL nano
set -U fish_greeting ""
oh-my-posh init fish --config '~/.config/fish/posh.json' | source
end
