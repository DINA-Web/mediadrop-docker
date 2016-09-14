FROM alpine
RUN apk add --update tini perl gnupg perl-digest-hmac curl
ADD https://raw.githubusercontent.com/rtdp/s3curl/master/s3curl.pl /s3curl.pl
ENTRYPOINT ["tini", "--"]
CMD sh -c "perl s3curl.pl --id $ACCESS_KEY --key $SECRET_KEY https://s3-archive.api.cloud.ipnett.se/"
