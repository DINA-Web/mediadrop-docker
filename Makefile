NAME = dina/upload
VERSION = $(TRAVIS_BUILD_ID)
ME = $(USER)
TS := $(shell date '+%Y_%m_%d_%H_%M')
HOST := $(shell hostname)

all: build up
.PHONY: all

build:
	docker-compose build

debug-s3curl:
	docker-compose run --rm s3curl sh

debug-s3cmd:
	docker-compose run --rm s3cmd bash
#	docker-compose run --rm s3cmd sh -c "/start.sh no-sync"

debug-smb:
	docker-compose up -d samba
	xdg-open smb://$(HOST)/data

up:
	docker-compose up -d
	@echo "The samba share is available at smb://$(HOST)/data"

upload-s3cmd:
	docker-compose run --rm s3cmd

upload-s3curl:
	docker-compose run --rm s3curl

down:
	docker-compose stop
	docker-compose rm -vf

