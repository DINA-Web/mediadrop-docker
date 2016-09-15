FROM alpine
RUN apk add --update \
	tini \
	clamav clamav-libunrar freshclam

RUN freshclam
ENTRYPOINT ["tini", "--"]
CMD ["clamscan", "-rv", "/tmp"]
