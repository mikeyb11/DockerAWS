sudo docker rm -v $(sudo docker ps -a -q -f status=exited)
