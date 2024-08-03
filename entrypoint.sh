#!/usr/bin/env bash
#
# entrypoint.sh for Uptime Kuma
# Execute a custom script before running Uptime Kuma

# Variables
export CONFIG_ROOT=/config
CONFIG_ROOT_MOUNT_CHECK=$(mount | grep ${CONFIG_ROOT})

# Start custom script run.sh
if [ -f ${CONFIG_ROOT}/run.sh ]; then
    cp ${CONFIG_ROOT}/run.sh ./run.sh
    chmod +x ./run.sh
    ./run.sh
fi

# Let's make sure we are where we need to be
cd /app
# Run the arguments from CMD in the Dockerfile
# In our case we are starting nginx by default
# Dockerfile CMD ["node", "server/server.js"]
exec "$@"
