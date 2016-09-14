FROM istepanov/backup-to-s3
COPY start.sh /start.sh
COPY .s3cfg /root/.s3cfg
RUN chmod +x /start.sh

ENV TINI_VERSION v0.10.0
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini.asc /tini.asc
RUN gpg --keyserver ha.pool.sks-keyservers.net --recv-keys 595E85A6B1B4779EA4DAAEC70B588DFF0527A9B7 \
 && gpg --verify /tini.asc
RUN chmod +x /tini

ENTRYPOINT ["/tini", "--"]
CMD ["/start.sh", "no-cron"]
