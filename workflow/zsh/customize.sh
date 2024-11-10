source ~/.zshrc

if [[ -n "$shellpers_workflow_zsh_customize" ]]; then
    echo "Prompt customization is already added."
    exit 0
fi

if [ -n "$(tail -c 1 ~/.zshrc)" ]; then
    echo >>~/.zshrc
    echo >>~/.zshrc
else
    echo >>~/.zshrc
fi

bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

git clone https://github.com/zdharma-continuum/fast-syntax-highlighting ~/.fast-syntax-highlighting

source ~/.fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

cat "$(dirname "$0")/vcs-prompt.sh" >>~/.zshrc
