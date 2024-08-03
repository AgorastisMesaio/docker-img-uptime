# Dockerfile for Upitime Kuma image
#
# This Dockerfile sets up a the uptime container that you can use
# inside your docker compose projects or standalone.
#
# I'm implementing Auto Login capability so it's easier
# for developers working on DB's
#
FROM louislam/uptime-kuma

RUN apt-get update \
    && apt-get install -y default-mysql-client nano

# Needed for our custom nanorc
ADD config/nanorc /etc/nanorc
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

# The sqlite insertion part
ADD config/init.sql.db /init.sql.db
ADD config/run.sh /run.sh
RUN chmod +x /run.sh
RUN /run.sh

