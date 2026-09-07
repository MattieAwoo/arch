function cz-sync --description 'Automatically capture new files, changes, and push chezmoi configurations'
    echo "🔍 Scanning managed directories for brand-new files..."
    
    # 1. Grab all directories chezmoi manages, and force a recursive add to capture brand-new files
    chezmoi managed --include=dirs -0 | xargs -0 -I {} chezmoi add --recursive "$HOME/{}"

    # 2. Update status of existing tracked files that were modified
    echo "📝 Refreshing existing modified files..."
    chezmoi re-add

    # 3. Show you what changed
    echo "📊 Current Status:"
    chezmoi status

    # 4. Optional: Auto-commit and push to Git/GitHub if inside a git repo
    if test -d (chezmoi source-path)/.git
        echo "   "
        read -l -P "🚀 Push changes to your Git remote? [y/N] " confirm
        if string match -ri '^[yY](es)?$' -- $confirm
            echo "📤 Syncing repository..."
            chezmoi git add .
            chezmoi git commit -- -m "Auto-update dotfiles: (date '+%Y-%m-%d %H:%M')"
            chezmoi git push origin main
        end
    end
end
