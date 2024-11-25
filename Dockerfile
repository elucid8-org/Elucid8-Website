FROM croservices/cro-http:0.8.9
RUN mkdir /app
COPY . /app
WORKDIR /app
RUN zef install --deps-only . && raku -c -Ilib service.raku
ENV WEBSITE_HOST="0.0.0.0" WEBSITE_PORT="10000"
EXPOSE 10000
CMD raku -Ilib service.raku
