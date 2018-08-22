#!/usr/bin/env sh

# Copy downloads into 'plugins'
if [ -d "/data/build/downloads/plugins" ]; then
    cp /data/build/downloads/plugins/* /opt/xl-release-server/default-plugins/__local__
fi

# Copy to plugins
cp /data/build/libs/*.jar /opt/xl-release-server/default-plugins/__local__

# Link the license
ln -s /license/xl-release-license.lic /opt/xl-release-server/default-conf/xl-release-license.lic

# Link `ext` folder
find /data/src/main/resources -maxdepth 1 -mindepth 1 -type d -exec ln -s -f '{}' /opt/xl-release-server/ext/ \;

# Start XLR and
export ADMIN_PASSWORD=admin
export REPOSITORY_KEYSTORE_PASSPHRASE=admin
/usr/bin/dumb-init /opt/xl-release-server/bin/run-in-container.sh