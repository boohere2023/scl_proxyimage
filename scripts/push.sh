#! /bin/bash
#Commit Image
docker commit $(docker container ls  | grep 'aapanel' | awk '{print $1}') sclbo/`hostname`:`date +%Y%m%d`
#Push image to DockerHUB
docker push sclbo/`hostname`:`date +%Y%m%d`
#Delete Image  after push
docker image rm sclbo/`hostname`:`date +%Y%m%d`
