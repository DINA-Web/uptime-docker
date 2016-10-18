SHELL = /bin/bash
TS = $(shell date "+%Y_%m_%d_%H_%M")
DB = uptimedocker_mongo_1

test:
	echo $(MAIL_USER)

all: up

up:
	@docker-compose up -d

clean:
	@docker-compose stop
	@docker-compose rm -vf

backup:
	@echo "Backing up data"
	@docker exec -it $(DB) \
		sh -c "mongodump --out=/tmp/dump_$(TS)"
	@mkdir -p backups && docker cp $(DB):/tmp/dump_$(TS) backups/dump_$(TS)

restore:
	@echo "Restoring from a backup"
	@docker cp backups/dump $(DB):/tmp/dump
	@docker exec -it $(DB) \
		sh -c "mongorestore --drop --dir=/tmp/dump"
