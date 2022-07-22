#!/bin/bash
set -e

if [ -f /app/tmp/pids/server.pid ]; then
  rm /usr/src/raba/tmp/pids/server.pid
fi

case "$1" in
"server")
  shift
  exec bundle exec puma -C config/puma.rb "$@"
  ;;
"sidekiq")
  shift
  exec bundle exec sidekiq  "$@"
  ;;
"migrate")
  exec bundle exec rake db:migrate 2>/dev/null || bundle exec rake db:setup
  ;;
*)
  exec "$@"
  ;;
esac
