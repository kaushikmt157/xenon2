if [[ $1 == "--help" ]]; then
  echo "sysopctl - Command to manage system resources."
  echo "Usage: sysopctl <command> [options]"
  echo "Commands:"
  echo "  service list           List running services"
  echo "  system load            Show system load"
  echo "  service start <name>   Start a service"
  echo "  service stop <name>    Stop a service"
  echo "  disk usage             Show disk usage"
  echo "  process monitor        Monitor processes in real time"
  echo "  logs analyze           Analyze system logs"
  echo "  backup <path>          Backup system files"
  exit 0
fi

if [[ $1 == "--version" ]]; then
  echo "sysopctl version v0.1.0"
  exit 0
fi

if [[ $1 == "service" && $2 == "list" ]]; then
  systemctl list-units --type=service
  exit 0
fi

if [[ $1 == "system" && $2 == "load" ]]; then
  uptime
  exit 0
fi

if [[ $1 == "service" && $2 == "start" ]]; then
  systemctl start $3
  echo "Service $3 started."
  exit 0
fi

if [[ $1 == "service" && $2 == "stop" ]]; then
  systemctl stop $3
  echo "Service $3 stopped."
  exit 0
fi

if [[ $1 == "service" && $2 == "start" ]]; then
  systemctl start $3
  echo "Service $3 started."
  exit 0
fi

if [[ $1 == "service" && $2 == "stop" ]]; then
  systemctl stop $3
  echo "Service $3 stopped."
  exit 0
fi

if [[ $1 == "disk" && $2 == "usage" ]]; then
  df -h
  exit 0
fi

if [[ $1 == "process" && $2 == "monitor" ]]; then
  top
  exit 0
fi

if [[ $1 == "logs" && $2 == "analyze" ]]; then
  journalctl -p 3 -xb
  exit 0
fi

if [[ $1 == "backup" && -n $2 ]]; then
  rsync -avz $2 /backup/location
  echo "Backup initiated for $2."
  exit 0
fi
