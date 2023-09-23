# Initialize compinit
autoload -Uz compinit && compinit
# This line initializes the zsh completion system, allowing for features like auto suggestions and corrections.

# Load nvm (Node Version Manager), if available
export NVM_DIR="$HOME/.nvm" # Sets the location of the nvm directory.
# These lines check if nvm and its bash completion files exist and source them if they do.
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Add Amplify CLI binary installer to the PATH
export PATH="$HOME/.amplify/bin:$PATH" # Adds the directory containing the Amplify CLI binary to the system PATH.

# Customized colorful prompt resembling a rainbow
# Customized colorful prompt resembling a rainbow
function precmd() {
    # Define an array of colors resembling the colors of the rainbow
    local colors=('red' 'yellow' 'green' 'cyan' 'blue' 'magenta' 'purple')
    # Split the current working directory into segments
    local PWD_ARRAY=("${(@s:/:)PWD}")
    # Initialize the colored prompt string
    local colored_prompt=""
    local color_index=0 # Start with the first color in the array i.e., red.
    
    # Iterate over each segment and append the colored segment to the prompt string.
    for segment in "${PWD_ARRAY[@]}"; do
        colored_prompt+="%F{${colors[$color_index]}}$segment%f/"
        ((color_index = (color_index + 1) % ${#colors[@]}))
    done

    # Set the colored prompt string as the prompt and replace the last character with a $.
    PS1="$colored_prompt\$ "
}
