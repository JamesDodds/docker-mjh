FROM alpine:3.7
MAINTAINER docker@doddshq.com

# Add files and folders
ADD crontab /etc/cron.d/grab-cron
COPY grab.sh regions /usr/epggrab/
COPY entry.sh /entry.sh
RUN mkdir /data && touch /var/log/cron.log

# Give execution rights on the cron job and grabber
RUN chmod 0644 /etc/cron.d/grab-cron && \
    chmod +x /usr/epggrab/grab.sh /entry.sh && \
    chmod -x /usr/epggrab/regions

# Set the /data folder as a Volume
VOLUME /data

# Install the things
RUN apk add --update \
    curl \
    bash \
    && rm -rf /var/cache/apk/*

# Get some data to start off and set cron
RUN /bin/bash /usr/epggrab/grab.sh && \
    /usr/bin/crontab /etc/cron.d/grab-cron

# Run the command on container startup
CMD ["/entry.sh"]