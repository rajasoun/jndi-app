#!/usr/bin/env bash

set -eo pipefail
BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "scripts/actions.bash"
source "scripts/os.bash"
source "scripts/web.bash"
source "config/ssl"

ROUTER=" -f apps/router/docker-compose.yml"
WHOAMI=" -f apps/whoami/docker-compose.yml"
  JNDI=" -f apps/jndi/docker-compose.yml"

COMPOSE_FILES="$ROUTER $JNDI $WHOAMI"
services=(jndi whoami)
export services BASE_DIR

function help(){
    echo "Usage: $0  {up|down|status|logs}" >&2
    echo
    echo "   up          ->   Provision, Configure, Validate Application Stack"
    echo "   down        ->   Destroy Application Stack"
    echo "   status      ->   Displays Status of Application Stack"
    echo "   logs        ->   Application Stack Logs"
    echo
    return 1
}

opt="$1"
choice=$( tr '[:upper:]' '[:lower:]' <<<"$opt" )
case $choice in
    up)
      echo "Bring Up Application Stack"
      docker-compose ${COMPOSE_FILES} up -d
      echo "Adding Host Enteries...  "
      add_host_entries
      verify_certificates
      display_app_status
      ;;
    down)
      echo "Destroy Application Stack & Services"
      docker-compose ${COMPOSE_FILES} down
      echo "Removing Host Enteries & Log files...  "
      remove_host_entries
      rm -fr logs/*.log
      ;;
    status)
      display_app_status
      echo -e "\nContainers Status..."
      docker-compose ${COMPOSE_FILES} ps
      ;;
    logs)
      echo "Containers Log..."
      tail -f apps/router/logs/traefik.log | grep "$2"
      ;;
    *)  help ;;
esac