FROM alpine:latest

# Install Postfix.
RUN apk add postfix postfix-sqlite

# Copy over config files.
COPY postfix/* /etc/postfix/

# Configure Postfix to use the SQLite database.
RUN postconf virtual_mailbox_domains=sqlite:/etc/postfix/sqlite-virtual-mailbox-domains.cf && \
    postconf virtual_mailbox_maps=sqlite:/etc/postfix/sqlite-virtual-mailbox-maps.cf && \
    postconf virtual_alias_maps=sqlite:/etc/postfix/sqlite-virtual-alias-maps.cf

# Start Postfix.
CMD ["postfix", "start-fg"]
