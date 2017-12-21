fmpc() {
  local song_position
  song_position=$(mpc -f "%position%) %artist% - %title%" playlist | \
    fzf-tmux --query="$1" --reverse --select-1 --exit-0 | \
    sed -n 's/^\([0-9]\+\)).*/\1/p') || return 1
  [ -n "$song_position" ] && mpc -q play $song_position
}

pl() {
  local playlist
  if [[ $1 == '-a' ]]; then
    playlist=$(mpc lsplaylists | fzf) && mpc load "$playlist" && mpc play -q
  else
    playlist=$(mpc lsplaylists | fzf) && mpc -q clear && mpc load "$playlist" && mpc play -q
  fi
}
