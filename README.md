# dropmedia-docker

The functionality provided through dropmedia-docker:

- the ability to share files in a folder available from the host with other applications using samba
- to be able to sync this same folder to cold storage off-site (over an S3 connection)...

In this project, the default setup in `docker-compose.yml` maps a directory `data` into the samba container, which then expose these files over samba to the rest of the network. 

Through the Makefile, two different docker images can be used to spin up two containers that provide two similar but different commands to sync data to an S3 archive: s3cmd (a Python-based cli tool) and s3curl (a Perl-based cli tool).

# Usage notes for synching with an S3 connection

Use `.env` to specify s3cmd-style credentials, a text file with environment variables like:

	ACCESS_KEY=*
	SECRET_KEY=*
	S3_PATH=s3://{hostname-for-s3-provider}
	HOST_BASE={hostname-for-s3-provider}
	HOST_BUCKET=s3://{hostname-for-s3-provider}/
	WEBSITE_ENDPOINT=https://%(bucket).{hostname-for-s3-provider}/

Then issue "make build" and then "make upload-s3cmd" or "make upload-s3curl" to sync the data.

For debugging purposes and tweaking of configurations, use "make debug-s3cmd" and "make debug-s3curl".
