# xlr_dev_run #

Docker image that has XLR installed, mounts your source code and executes compilation using gradle wrapper. 
After compilation it starts XLR and links the `ext` folder to your plugin.

# Supported tags #

* `latest`, `v6.1.0.1`
* `v6.0.0.1`
* `v5.0.1.11`

# Starting #

```
docker run -p 5516:5516 -v [PROJECT_DIR]/myproject:/data -v /home/username/xl-licenses:/license -v /home/username/.xlgradle:/root/.gradle xebialabs/xlr_dev_run
```

where:

* `data`: Mountpoint pointing to root directory of your plugin.
* `xl-licenses`: Folder containing the XLD license.
* `xlgradle`: Is used to cache gradle dependencies.
