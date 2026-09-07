function config --wraps='git --git-dir=/home/mattie/.cfg/ --work-tree=/home/mattie' --description 'alias config=git --git-dir=/home/mattie/.cfg/ --work-tree=/home/mattie'
    git --git-dir=/home/mattie/.cfg/ --work-tree=/home/mattie $argv
end
