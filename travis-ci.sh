#!/bin/bash

echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
TOKEN=$(curl -s -H "Content-Type: application/json" -X POST -d "
{
\"username\": \"$DOCKER_USERNAME\",
\"password\": \"$DOCKER_PASSWORD\"
}
" https://hub.docker.com/v2/users/login/ | jq -r .token)

http --follow https://gist.githubusercontent.com/jdewinne/3f13494858fad8b6b2b88ebd3439f1ea/raw/2ca20118482b7790fdbc0a1e3cbe6a3d4e78933b/dockertags > ./dockertags
chmod +x dockertags

image_name="xebialabsunsupported/xlr_dev_run"
./dockertags -i xebialabsunsupported/xlr_dev_run > /tmp/xlr_dev_run
./dockertags -i $image_name > /tmp/xlr_dev_run
echo "$DOCKER_PASSWORD" | docker login -u "$DOCKER_USERNAME" --password-stdin
while read tag ; do
    docker build -t $image_name:$tag --build-arg xlr_tag=$tag .
    echo "####################################################################"
    echo "####        $image_name:$tag built"
    docker push $image_name:$tag
    echo "####        $image_name:$tag pushed"
    echo "####################################################################"
    docker push $image_name:$tag
done < <(comm -23 <(sort /tmp/xlr_dev_compile) <(sort /tmp/xlr_dev_run))
