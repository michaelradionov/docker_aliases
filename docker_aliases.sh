# Docker aliases
alias dps='docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Names}}\t{{.Size}}\t{{.RunningFor}}"'
alias dpss='docker ps --format "table {{.ID}}\t{{.Image}}\t{{.Names}}\t{{.Mounts}}\t{{.Ports}}"'
alias din='function _din(){ docker exec -it $1 bash; };_din'
alias dinc='function _dinc(){ docker exec -t $1 bash -c "$2"; };_dinc'
alias dc='docker-compose'

dorm (){
  read -p 'Stop and remove all containers? Are you sure??? [y]: ' y

  case $y in
    y)
    echo 'DEATH TO CONTAINERS!!!'
    docker stop $(docker ps -q)
    check_command_exec_status $?
    docker rm $(docker ps -qa)
    check_command_exec_status $?
    echo 'Done... Are you happy?'
    ;;
    *)
    echo 'Ok, letting them live :)';;
  esac
}
