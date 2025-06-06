#!/bin/bash

PROCCESSES=("scrcpy")

INHIBIT_PID_FILE="/tmp/hypridle-inhibit.pid"
INHIBITED=0

start_inhibit() {
  systemd-inhibit --what=idle --who="hypridle-inhibit" --why="Detected activity" sleep infinity &
  echo $! > $INHIBIT_PID_FILE
  INHIBITED=1
}

stop_inhibit() {
  if [ -f "$INHIBIT_PID_FILE" ]; then
    kill "$(cat "$INHIBIT_PID_FILE")" 2>/dev/null
    rm -f "$INHIBIT_PID_FILE"
    INHIBITED=0
  fi
}

is_inhibited() {
  [ -f "$INHIBIT_PID_FILE" ] && kill -0 "$(cat "$INHIBIT_PID_FILE")" 2>/dev/null
}

while true; do
  echo $INHIBITED
  INHIBIT=0

  for PROC in "${PROCCESSES[@]}"; do
    if pgrep "$PROC" > /dev/null; then
      INHIBIT=1
      break
    fi
  done

  if [ "$INHIBIT" -eq 1 ] && [ "$INHIBITED" -eq 0 ]; then
    start_inhibit
  elif [ "$INHIBIT" -eq 0 ] && [ "$INHIBITED" -eq 1 ]; then
    rm -f "$LOCKFILE"
    stop_inhibit
  fi

  sleep 10
done
