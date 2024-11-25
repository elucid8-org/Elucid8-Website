[![License: Artistic-2.0](https://img.shields.io/badge/License-Artistic%202.0-0298c3.svg)](https://opensource.org/licenses/Artistic-2.0)

# Elucid8::Website

simple website written in Cro::WebApp to be served at https://elucid8.org

# Server

this site runs on a linux server preloaded with git, raku, zef (& docker-compose)

# Deployment
- `zef install https://github.com/elucid8-org/Elucid8-Website.git --deps-only --/test`
- `git clone https://github.com/elucid8-org/Elucid8-Website.git && cd Elucid8-Website`
- adjust .cro.yml for your needs (e.g. HTTPS)
- `cro run`

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
