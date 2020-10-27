# a simple cloudreve container with offline download

## how to use
docker-compose.yml
```
version: '3'
services:
  cloudreve:
    image: ssst0n3/cloudreve-docker:latest
    volumes:
      - data:/data
      - config:/etc/cloudreve
      - temp:/aria2_downloads
    ports:
      - "5212:5212"
    restart: unless-stopped
  aria2:
    image: p3terx/aria2-pro
    logging:
      options:
        max-size: 1m
    environment:
      - PUID=${CLOUDREVE_PUID}
      - PGID=${CLOUDREVE_PGID}
      - RPC_SECRET=${ARIA2_RPC_SECRET}
    volumes:
      - aria2_conf:/aria2_conf
      - temp:/aria2_downloads
    restart: unless-stopped
volumes:
  data:
  config:
  temp:
  aria2_conf:
```

## ATTENTION: edit the variable ARIA2_RPC_SECRET in file .env