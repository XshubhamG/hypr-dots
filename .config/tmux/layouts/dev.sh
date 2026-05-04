#!/usr/bin/env bash

SESSION=$(tmux display-message -p '#S')
CURRENT_DIR=$(tmux display-message -p '#{pane_current_path}')

# ---- Window 1: NVIM ----
tmux rename-window -t "$SESSION:1" "Editor"
tmux send-keys -t "$SESSION:1" "nvim" C-m

# ---- Window 2: GEMINI ----
tmux new-window -t "$SESSION" -n "Agent" -c "$CURRENT_DIR"
tmux send-keys -t "$SESSION:2" "gemini" C-m

# ---- Window 3: DEV ----
tmux new-window -t "$SESSION" -n "Dev" -c "$CURRENT_DIR"

# create layout (3 panes)
tmux split-window -h -t "$SESSION:3" -c "$CURRENT_DIR"
tmux split-window -v -t "$SESSION:3.2" -c "$CURRENT_DIR"

# pane layout:
# [1 | 2(top) ]
#     3(bottom)

# run dev server in first pane
tmux send-keys -t "$SESSION:3.1" "bun run dev || pnpm dev" C-m

# focus back to main pane
tmux select-window -t "$SESSION:1"
