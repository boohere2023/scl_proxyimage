#! /bin/bash
#Commit Image
docker commit $(docker container ls  | grep 'aapanel' | awk '{print $1}') sclbo/`hostname`:`date +%Y%m%d`
Docker tag sclbo/`hostname`:`date +%Y%m%d` sclbo/`hostname`:latest
#Push image to DockerHUB
docker push sclbo/`hostname` -a
#Delete Image  after push
docker image rm sclbo/`hostname`:`date +%Y%m%d`
#Send noti to Telegram
curl -s -X POST https://api.telegram.org/bot6610952238:AAGm5oIqkfZbRmB8-paUVHtSh9RtjY5gbcA/sendMessage -d chat_id=-4138242522 -d text="Backup `hostname` to DockerHUB COMPLETED!"
