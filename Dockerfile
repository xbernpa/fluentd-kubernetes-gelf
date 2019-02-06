FROM fluent/fluentd:v1.2.1
MAINTAINER Eugene Obrezkov <ghaiklor@gmail.com>
USER root
WORKDIR /home/fluent
ENV PATH /home/fluent/.gem/ruby/2.3.0/bin:$PATH

# Install prerequisites for fluentd
RUN set -ex \
    && apk add --no-cache --virtual .build-deps build-base ruby-dev libffi-dev \
    && echo 'gem: --no-document' >> /etc/gemrc \
    && gem install fluent-plugin-kubernetes_metadata_filter -v 2.1.2 \
    && gem install fluent-plugin-json-transform -v 0.0.2 \
    && gem install fluent-plugin-mutate_filter -v 1.0.7 \
    && gem install fluent-plugin-gelf-hs -v 1.0.7 \
    && gem install fluent-plugin-rewrite-tag-filter -v 2.1.1 \
    && apk del .build-deps \
    && gem sources --clear-all \
    && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem

# Copy entrypoint.sh
COPY ./bin/entrypoint.sh /bin/
RUN chmod +x /bin/entrypoint.sh

# Copy configuration files
COPY ./conf/fluent.conf /fluentd/etc/
COPY ./conf/kubernetes.conf /fluentd/etc/

# Copy plugins
COPY ./plugins/parser_kubernetes.rb /fluentd/plugins/

# Environment variables
ENV FLUENTD_OPT=""
ENV FLUENTD_CONF="fluent.conf"

# jemalloc is memory optimization only available for td-agent
# td-agent is provided and QA'ed by treasuredata as rpm/deb/.. package
# -> td-agent (stable) vs fluentd (edge)
#ENV LD_PRELOAD="/usr/lib/libjemalloc.so.2"

# Run Fluentd
ENTRYPOINT ["/bin/entrypoint.sh"]
CMD exec fluentd -c /fluentd/etc/$FLUENTD_CONF -p /fluentd/plugins $FLUENTD_OPT
