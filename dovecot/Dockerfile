FROM alpine:latest

# Install Dovecot.
RUN apk add \
    dovecot \
    dovecot-sqlite \
    dovecot-lmtpd \
    dovecot-pop3d \
    dovecot-pigeonhole-plugin

# Copy over config files.
COPY dovecot/dovecot-sql.conf.ext /etc/dovecot/
COPY dovecot/conf.d/* /etc/dovecot/conf.d/

# Create vmail user to manage mail directory.
RUN addgroup -g 5000 -S vmail
RUN adduser --home /var/vmail --ingroup vmail --uid 5000 --disabled-password vmail

CMD ["dovecot", "-F"]
