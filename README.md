# gulag-docker
setup instructions
```bash
mkdir certs
# taken from gulag repo thanks cmyui
# generate an ssl certificate for your domain (change email & domain)
sudo certbot certonly \
    --manual \
    --preferred-challenges=dns \
    --email your@email.com \
    --server https://acme-v02.api.letsencrypt.org/directory \
    --agree-tos \
    -d *.your.domain

# copy certificates
cp /etc/letsencrypt/live/your.domain/fullchain.pem certs
cp /etc/letsencrypt/live/your.domain/privkey.pem certs

# copy and configure this
cp config.sample.py config.py
nano config.py

# copy and configure this too
cp nginx.sample.conf nginx.conf
nano nginx.conf

# build docker image
# change or remove tag if you want to
docker build . -t gulag:3.2.4

# then create a docker container with the image (idk how to do it and i'm too lazy to google so figure it out yourself i guess)
```
