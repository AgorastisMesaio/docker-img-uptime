# Dockerfile for customized Uptime Kuma
#
# This Dockerfile sets up a the uptime container that you can use
# inside your docker compose projects or standalone.
#
FROM louislam/uptime-kuma

RUN apt-get update \
    && apt-get install -y default-mysql-client nano procps

# Needed for our custom nanorc
ADD nanorc /etc/nanorc
RUN mkdir /root/.nano

# Create the /usr/bin/confcat file with heredocs
RUN cat <<'EOF' > /usr/bin/confcat
#!/bin/bash
#
# confcat: removes lines with comments, very useful as a substitute
# for the "cat" program when we want to see only the effective lines,
# not the lines that have comments.

grep -vh '^[[:space:]]*#' "$@" | grep -v '^//' | grep -v '^;' | grep -v '^$'
EOF

# Make the confcat file executable
RUN chmod +x /usr/bin/confcat

# Create the /usr/bin/e file with heredocs
RUN cat <<'EOF' > /usr/bin/e
#!/bin/bash
nano "${*}"
EOF

# Make the e file executable
RUN chmod +x /usr/bin/e

# Copy and run custom entrypoint scripts
ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]

# Uptime Kuma working directory
WORKDIR /app

# The CMD line represent the Arguments that will be passed to the
# entrypoint.sh. We'll use them to indicate the script what
# command will be executed through our entrypoint when it finishes
# Executing default's uptime kuma cmd
CMD ["node", "server/server.js"]
