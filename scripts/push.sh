#! /bin/bash
#Commit Image
docker commit $(docker container ls  | grep 'aapanel' | awk '{print $1}') sclbo/`hostname`:`date +%Y%m%d`
Docker tag sclbo/`hostname`:`date +%Y%m%d` sclbo/`hostname`:latest
#Push image to DockerHUB
docker push sclbo/`hostname` -a
#Delete Image  after push
docker image rm sclbo/`hostname`:`date +%Y%m%d`

