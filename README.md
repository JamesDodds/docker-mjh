# docker-mjh
Simple docker container to grab EPG and m3u8 IPTV files that [Matt Huisman] [has generated](https://www.matthuisman.nz/2019/02/libreelec-tvheadend-iptv-freeview-au.html). 


# Usage
- Currently set to use Melbourne as the only location. Add more to the locations file
- Mount the /data folder from the container to wherever you need to pull the epg from

## Docker

### Build yourself
```
git clone https://github.com/JamesDodds/docker-mjh.git && \
docker build --tag mjh-epg-grab:latest ./docker-mjh/ && \
docker run --detach --name epggrab -v /tvh/data:/data mjh-epg-grab:latest
```

### Grab from Docker hub
Doesn't exist yet :)

# Notes
- If you put multiple locations in the locations file, it will mash the XML's together. TVHeadend didn't seem to have a problem importing them. Probably could do with being done better.

### Todos

 - Write more instructions



[Matt Huisman]: <https://www.matthuisman.nz/>