FROM alpine:3.7
MAINTAINER docker@doddshq.com

# Add crontab file in the cron directory
ADD crontab /etc/cron.d/grab-cron
ADD grab.sh /usr/epggrab/grab.sh

# Give execution rights on the cron job
RUN chmod 0644 /etc/cron.d/grab-cron

# Create the log file to be able to run tail
RUN touch /var/log/cron.log

## Install the things
RUN apk add --update \
    curl \
    && rm -rf /var/cache/apk/*

# Run the command on container startup
CMD cron && tail -f /var/log/cron.log
