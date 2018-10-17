#!/usr/bin/env sh

# Copy downloads into 'plugins'
if [ -d "/data/build/downloads/plugins" ]; then
    cp /data/build/downloads/plugins/* ${APP_HOME}/default-plugins/__local__
fi

# Copy to plugins
cp /data/build/libs/*.jar ${APP_HOME}/default-plugins/__local__

# Link the license
ln -s /license/xl-release-license.lic ${APP_HOME}/default-conf/xl-release-license.lic

# Link `ext` folder
find /data/src/main/resources -maxdepth 1 -mindepth 1 -type d -exec ln -s -f '{}' ${APP_HOME}/ext/ \;

# Start XLR and
export ADMIN_PASSWORD=admin
export REPOSITORY_KEYSTORE_PASSPHRASE=admin
/opt/xebialabs/tini ${APP_HOME}/bin/run-in-container.sh