# xlr_dev_run #

Docker image that has XLR installed, mounts your source code and executes compilation using gradle wrapper. 
After compilation it starts XLR and links the `ext` folder to your plugin.

## Badges ##
[![Docker Stars](https://img.shields.io/docker/stars/xebialabs/xlr_dev_run.svg)]()
[![Docker Pulls](https://img.shields.io/docker/pulls/xebialabs/xlr_dev_run.svg)]()
[![Docker Automated buil](https://img.shields.io/docker/automated/xebialabs/xlr_dev_run.svg)]()
[![Docker Build Status](https://img.shields.io/docker/build/xebialabs/xlr_dev_run.svg)]()

# Supported tags #

+ `latest`, `v7.0.1.1`
+ `v7.0.0.1`
+ `v6.2.0.1`
+ `v6.0.0.1`
+ `v5.0.1.11`

# Starting #

```
docker run -p 5516:5516 -v [PROJECT_DIR]/myproject:/data -v /home/username/xl-licenses:/license -v /home/username/.xlgradle:/root/.gradle xebialabs/xlr_dev_run
```

where:

* `data`: Mountpoint pointing to root directory of your plugin.
* `xl-licenses`: Folder containing the XLD license.
* `xlgradle`: Is used to cache gradle dependencies.
