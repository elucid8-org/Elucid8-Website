[![License: Artistic-2.0](https://img.shields.io/badge/License-Artistic%202.0-0298c3.svg)](https://opensource.org/licenses/Artistic-2.0)

# Elucid8::Website

simple website written in Air to be served at https://elucid8.org

# Server

## Development

### Pico CSS (IntelliJ)
install sass (in the static/css dir)
  - follow this [guide](https://www.jetbrains.com/help/webstorm/transpiling-sass-less-and-scss-to-css.html)
    - install IJ sass & file watcher plugins
    - `cd static/css`
    - `brew install npm`
    - `npm install -g sass`
    - `npm install @picocss/pico`
    - in styles.css, `@use "node_modules/@picocss/pico/scss";`
    - `sass styles.scss styles.css`  [target is then styles.scss/styles]
    - `--load-path=node_modules/@picocss/pico/scss/`
from https://picocss.org
  - some tweaks to root styles (mainly to reduce scale) from [here](https://github.com/picocss/pico/discussions/482)

## Deployment
- `zef install https://github.com/elucid8-org/Elucid8-Website.git --deps-only --/test`
- `git clone https://github.com/elucid8-org/Elucid8-Website.git && cd Elucid8-Website`
- `zef install . --force-install --/test`
- adjust .cro.yml for your needs (e.g. HTTPS) -or-
- `export WEBSITE_HOST="0.0.0.0" && export WEBSITE_PORT="8888"`
- `raku -Ilib service.raku` -or-
- `nohup raku service.raku >> server.log 2>&1`  <=== detach from terminal [note PID]
- `tail -f server.log` and finally `kill -9 PID`  [ps -ef | grep raku]

## Build
this site runs on a linux server preloaded with git, raku, zef (& docker-compose)
- `sudo apt-get install build-essential` (for Digest::SHA1::Native)
- viz. https://chatgpt.com/share/6748a185-c690-8009-96ff-80bf8018dd7d
  - `sudo apt-get install nginx`
  - `sudo systemctl start nginx`
  - `sudo systemctl enable nginx`
  - etc
  - `vi simple.raku`   <= port to 8888   
  - `raku simple.raku`
- using librasteve for certbot

# COPYRIGHT AND LICENSE

copyright(c) 2025 Contributors

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

NB. this will evolve as more work is done (e.g. docker, nginx, cert)

with some inspiration from https://github.com/Altai-man/sample-cro-crud & advent post

# Docker container

The website can be deployed by creating the docker image (with sudo)
and running it, as follows

```
docker build -t elucid8/website .
docker run --rm -p 10000:10000 elucid8/website
```
The docker image can also be found on docker.com,
so this works as well
```
sudo docker pull docker.io/finanalyst/elucid8-website
sudo docker run -d --rm -p 10000:10000 docker.io/finanalyst/elucid8-website
```

# TODOS
- [ ] compare to GH pages
- [ ] grab md from cro docs

