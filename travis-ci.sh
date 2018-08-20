#!/bin/bash

http --follow https://gist.githubusercontent.com/jdewinne/3f13494858fad8b6b2b88ebd3439f1ea/raw/dce2f06fea89a6038acd6944c516c8be9347c48d/dockertags > ./dockertags
chmod +x dockertags

image_name="xebialabsunsupported/xlr_dev_run"
./dockertags -i xebialabsunsupported/xlr_dev_compile > /tmp/xlr_dev_compile
./dockertags -i $image_name > /tmp/xlr_dev_run
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
while read tag ; do
    docker build -t $image_name:$tag --build-arg xlr_tag=$tag .
    docker push $image_name:$tag
done < <(comm -23 <(sort /tmp/xlr_dev_compile) <(sort /tmp/xlr_dev_run))