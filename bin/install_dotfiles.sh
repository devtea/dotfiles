# Shamelessly stolen from https://github.com/jdavis 
if [[ -d ~/.git ]]; then
    echo "Oh my. It looks like you already have a Git repository in your home directory. You'll need to fix this before you install the dotfiles."
    exit
fi

if [[ -d ~/dotfiles.old ]]; then
    echo "Well, I was going to put all your old files into dotfiles.old, but it appears you already have a directory named that. Move it and try again... Please?"
    exit
fi

hash git 2> /dev/null || {
    echo "Oh dear. I require Git, but it's not installed."

    echo
    echo "I'll grab a couple minimal things for you..."

    # download bare env manually
    mkdir ~/dotfiles.old
    mv ~/.aliases ~/.bash_profile ~/.bashrc ~/.commonrc ~/.exports ~/.functions ~/.zshrc ~/dotfiles.old
    for file in .aliases .bash_profile .bashrc .commonrc .exports .functions .zshrc; do
        curl -L https://raw.githubusercontent.com/tdreyer1/dotfiles/master/${file} > ~/${file}
    done
    exit 1
}

echo
echo "Initializing a blank repo..."
git init

echo
echo "Adding dotfiles remote origin...."
git remote add origin https://github.com/tdreyer1/dotfiles.git

echo
echo "Fetching code..."
git fetch

echo
echo "Moving old dotfiles so we don't have a clash..."
mkdir dotfiles.old
git ls-tree -r --name-only origin/master | xargs -I {} mv {} dotfiles.old/ > /dev/null 2>&1

echo
echo "Checking out remote branch..."
git checkout -b master remotes/origin/master

echo
echo "Setting up submodules..."
git submodule init
git submodule update

builtin cd ~/.vim
git submodule init
git submodule update

echo
echo
echo "All old dotfiles were moved to dotfiles.old."

echo
echo
echo "To install Vundle Bundles, run the command below:"
echo "    vim +BundleInstall +qall"

echo
echo
echo "Dotfiles are now installed. Proceed to conquer the universe."

/usr/bin/env zsh
