#!/bin/bash
# statusline-command.sh — Claude Code status line
# Inspired by the bobthefish fish theme (user, dir, git branch) + model + context + caveman badge

input=$(cat)

# --- Claude info ---
model=$(echo "$input" | jq -r '.model.display_name // empty')
cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // empty')
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

# --- Shell-like info ---
user=$(whoami)
host=$(hostname -s)

# Shorten $HOME to ~
if [ -n "$cwd" ]; then
  short_dir="${cwd/#$HOME/\~}"
else
  short_dir="$(pwd)"
  short_dir="${short_dir/#$HOME/\~}"
fi

# Git branch (skip optional locks)
git_branch=$(GIT_OPTIONAL_LOCKS=0 git -C "${cwd:-$(pwd)}" symbolic-ref --short HEAD 2>/dev/null)

# --- Assemble segments ---

# user@host in cyan
printf '\033[36m%s@%s\033[0m' "$user" "$host"

# dir in bold yellow
printf ' \033[1;33m%s\033[0m' "$short_dir"

# git branch in green
if [ -n "$git_branch" ]; then
  printf ' \033[32m(%s)\033[0m' "$git_branch"
fi

# model in dim white
if [ -n "$model" ]; then
  printf ' \033[2m%s\033[0m' "$model"
fi

# context usage
if [ -n "$used_pct" ]; then
  used_int=$(printf '%.0f' "$used_pct")
  if [ "$used_int" -ge 80 ]; then
    printf ' \033[31mctx:%s%%\033[0m' "$used_int"
  elif [ "$used_int" -ge 50 ]; then
    printf ' \033[33mctx:%s%%\033[0m' "$used_int"
  else
    printf ' \033[2mctx:%s%%\033[0m' "$used_int"
  fi
fi

# caveman badge (if active)
FLAG="${CLAUDE_CONFIG_DIR:-$HOME/.claude}/.caveman-active"
if [ -f "$FLAG" ] && [ ! -L "$FLAG" ]; then
  MODE=$(head -c 64 "$FLAG" 2>/dev/null | tr -d '\n\r' | tr '[:upper:]' '[:lower:]')
  MODE=$(printf '%s' "$MODE" | tr -cd 'a-z0-9-')
  case "$MODE" in
    off|lite|full|ultra|wenyan-lite|wenyan|wenyan-full|wenyan-ultra|commit|review|compress)
      if [ -z "$MODE" ] || [ "$MODE" = "full" ]; then
        printf ' \033[38;5;172m[CAVEMAN]\033[0m'
      else
        SUFFIX=$(printf '%s' "$MODE" | tr '[:lower:]' '[:upper:]')
        printf ' \033[38;5;172m[CAVEMAN:%s]\033[0m' "$SUFFIX"
      fi
      ;;
  esac
fi
