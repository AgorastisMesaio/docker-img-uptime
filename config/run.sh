#!/usr/bin/env bash
#
echo == EXAMPLE of custom script ==================
echo Running ./config/run.sh custom script.
echo Modify this file to execute any custom script
echo ==============================================

# Variables
export CONFIG_ROOT=/config
CONFIG_ROOT_MOUNT_CHECK=$(mount | grep ${CONFIG_ROOT})

# Let's make sure we are where we need to be
cd /app/data

# Wait a bit and try to update the DB
if [ -f /init.sql.db ]; then
    ( sleep 5; cat /init.sql.db | sqlite3 /app/data/kuma.db; echo "Inserted into DB" ) &
fi
