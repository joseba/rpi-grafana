## Grafana Raspberry Pi Docker Image (armhf)

This repository contains the image for a Grafana container for use on a Raspberry Pi.
The image uses the unofficial Grafana armhf build.

```bash
docker volume create grafana_data
docker run -d -p 22:22 -p 3000:3000 -v grafana_data:/data joseba/rpi-grafana
```

