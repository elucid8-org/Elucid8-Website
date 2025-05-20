FROM docker.io/finanalyst/raku-cro-base
# alpine dependents needed by RRR
RUN apk add --no-cache graphviz
# install a SASS compiler
ARG DART_SASS_VERSION=1.82.0
ARG DART_SASS_TAR=dart-sass-${DART_SASS_VERSION}-linux-x64-musl.tar.gz
ARG DART_SASS_URL=https://github.com/sass/dart-sass/releases/download/${DART_SASS_VERSION}/${DART_SASS_TAR}
ADD ${DART_SASS_URL} /opt/
RUN cd /opt/ && tar -xzf ${DART_SASS_TAR} && rm ${DART_SASS_TAR}
RUN ln -s /opt/dart-sass/sass /usr/local/bin/sass

RUN zef install -/test 'Air'

RUN mkdir /app /app/static /app/static/lib /app/static/css /app/lib
COPY lib/ /app/lib
COPY static/img /app/static/img
COPY static/css /app/static/css
COPY service.raku /app
COPY META6.json /app
WORKDIR /app
RUN raku -c -I. service.raku
ENV WEBSITE_HOST="0.0.0.0" WEBSITE_PORT="10000"
EXPOSE 10000
CMD raku -Ilib service.raku
