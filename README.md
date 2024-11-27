[![License: Artistic-2.0](https://img.shields.io/badge/License-Artistic%202.0-0298c3.svg)](https://opensource.org/licenses/Artistic-2.0)

# Elucid8::Website

simple website written in Cro::WebApp to be served at https://elucid8.org

# Server

this site runs on a linux server preloaded with git, raku, zef (& docker-compose)

# Development
## Intellij
install sass (in the static/css dir)
  - follow this [guide](https://www.jetbrains.com/help/webstorm/transpiling-sass-less-and-scss-to-css.html)
    - install IJ sass & file watcher plugins
    - `cd static/css`
    - `brew install npm`
    - `npm install -g sass`
    - `npm install @picocss/pico`
    - in styles.css, `@use "node_modules/@picocss/pico/scss";`
    - `sass styles.scss styles.css`  [target is then styles.scss/styles]
    - --load-path=node_modules/@picocss/pico/scss/

## Pico CSS
from https://picocss.org
  - some tweaks as root styles (mainly to reduce scale) from [here](https://github.com/picocss/pico/discussions/482)
    - 


# Deployment
- `zef install https://github.com/elucid8-org/Elucid8-Website.git --deps-only --/test`
- `git clone https://github.com/elucid8-org/Elucid8-Website.git && cd Elucid8-Website`
- adjust .cro.yml for your needs (e.g. HTTPS) and/or
- export WEBSITE_HOST="0.0.0.0" && export WEBSITE_PORT="20000"
- `raku -Ilib service.raku`

TODO: had to apply --force-build with Digest::SHA1::Native

NB. this will evolve as more work is done (e.g. docker, nginx, cert)

with some inspiration from https://github.com/Altai-man/sample-cro-crud & advent post

You can also build and run a docker image while in the app root using:

```
docker build -t elucid8/website .
docker run --rm -p 10000:10000 elucid8/website
```

# COPYRIGHT AND LICENSE

copyright(c) 2024 Contributors

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.


# TODOS
- [ ] compare to GH pages
- [ ] grab md from cro docs
- [ ] check if fragments released - pin deps
- [ ] pico root (sass?)