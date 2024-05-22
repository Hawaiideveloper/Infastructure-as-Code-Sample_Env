# Initialize Bash completion system, allowing for features like auto suggestions and corrections.
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
elif [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
fi

# Load nvm (Node Version Manager), if available
export NVM_DIR="$HOME/.nvm"
if [ -s "$NVM_DIR/nvm.sh" ]; then
    . "$NVM_DIR/nvm.sh"
fi
if [ -s "$NVM_DIR/bash_completion" ]; then
    . "$NVM_DIR/bash_completion"
fi

# Add Amplify CLI binary installer to the PATH
export PATH="$HOME/.amplify/bin:$PATH"

# Customized colorful prompt resembling a rainbow
function set_colored_prompt() {
    local colors=(
        '\[\033[31m\]' # Red
        '\[\033[33m\]' # Yellow
        '\[\033[32m\]' # Green
        '\[\033[36m\]' # Cyan
        '\[\033[34m\]' # Blue
        '\[\033[35m\]' # Magenta
        '\[\033[35m\]' # Purple
    )
    local reset_color='\[\033[0m\]'
    local IFS='/'
    local PWD_ARRAY=($PWD)
    local colored_prompt=""
    local color_index=0 # Start with the first color in the array i.e., red.
    
    for segment in "${PWD_ARRAY[@]}"; do
        colored_prompt+="${colors[$color_index]}$segment${reset_color}/"
        ((color_index = (color_index + 1) % ${#colors[@]}))
    done
    
    PS1="${colored_prompt}\$ "
}

# Set the prompt command to run before displaying each primary prompt.
PROMPT_COMMAND=set_colored_prompt
