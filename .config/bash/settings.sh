#!/bin/bash
#
# Common settings for bash.

# Get script path.
script_path="${BASH_SOURCE:-$0}"
if [ -L "$script_path" ]; then script_path=$(readlink -f "$script_path"); fi
script_dir=$(cd $(dirname "$script_path"); pwd)
dotconfig_dir=$(readlink -f "$script_dir/..")

# Set prompt color.
color_prompt=yes
force_color_prompt=yes

# Set bash_history setting.
export HISTCONTROL=ignoreboth:erasedups
shopt -u histappend
save_history="history -n; history -w; history -c; history -r"
if [[ ";$PROMPT_COMMAND;" != *";$save_history;"* ]]; then
  export PROMPT_COMMAND="$save_history; $PROMPT_COMMAND"
fi

# Load other setting files.
aliases_path="$script_dir/aliases.sh"
if [ -f "$aliases_path" ]; then source "$aliases_path"; fi

xdg_path="$script_dir/xdg-base.sh"
if [ -f "$xdg_path" ]; then source "$xdg_path"; fi

x11_path="$script_dir/x11.sh"
if [ -f "$x11_path" ]; then source "$x11_path"; fi

bw_path="$dotconfig_dir/bitwarden/settings.sh"
if [ -f "$bw_path" ]; then source "$bw_path"; fi

dcmd_path="$dotconfig_dir/docker/commands.sh"
if [ -f "$dcmd_path" ]; then source "$dcmd_path"; fi

fzf_path="$dotconfig_dir/fzf/fzf.bash"
if [ -f "$fzf_path" ]; then source "$fzf_path"; fi

gcloud_path="$dotconfig_dir/gcloud/gcloud.sh"
if [ -f "$gcloud_path" ]; then source "$gcloud_path"; fi

poetry_path="$dotconfig_dir/python/poetry.sh"
if [ -f "$poetry_path" ]; then source "$poetry_path"; fi

pipenv_path="$dotconfig_dir/python/pipenv.sh"
if [ -f "$pipenv_path" ]; then source "$pipenv_path"; fi

vscode_path="$dotconfig_dir/vscode/vscode.sh"
if [ -f "$vscode_path" ]; then source "$vscode_path"; fi
