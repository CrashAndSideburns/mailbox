FROM alpine:latest

# Install Postfix.
RUN apk add postfix postfix-sqlite sqlite

# Copy over config files.
COPY postfix/* /etc/postfix/

# Copy over start script and make executable.
COPY start.sh /usr/bin/
RUN chmod +x /usr/bin/start.sh

# Copy over database initialization script.
COPY init.sql .

# Configure Postfix to use the SQLite database.
RUN postconf virtual_mailbox_domains=sqlite:/etc/postfix/sqlite-virtual-mailbox-domains.cf && \
    postconf virtual_mailbox_maps=sqlite:/etc/postfix/sqlite-virtual-mailbox-maps.cf && \
    postconf virtual_alias_maps=sqlite:/etc/postfix/sqlite-virtual-alias-maps.cf

RUN postconf virtual_transport=lmtp:unix:private/dovecot-lmtp

# Initialize database and start Postfix.
CMD ["start.sh"]
