# ssldecoder-docker
Docker image build of github.com:enbrnz/ssl-decoder.git

## How-to download and run the ssldecoder docker container

1. Download and run the docker container:
```bash
docker run -d --name ssldecoder eneubauer/ssldecoder
```

2. Open the website in the browser
```bash
docker inspect ssldecoder | jq '.[].NetworkSettings.Networks[].IPAddress' | xargs firefox #or replace firefox with /path/to/your/browser
```
The container is configured to provide the page on port 80, however the port is not published, only exposed. Therefore you can only access the page on the internal docker container IP address.

3. If you only want the intermediate certificates (and no further analysis), enable the checkbox "Fast check".
> :warning: *Take security conclusions with a grain of salt as the ssldecoder project hasn't seen any updates in quite some time*
