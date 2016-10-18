# Alerts and Monitoring

This starts Uptime using Docker


## Usage

First, copy the `default.yaml.template` to `default.yaml` and edit the `$MAIL_*` settings to reflect your environment...

Then use the Makefile to manage the services:

	make up  # starts services
	make backup # backups data
	make restore # restores data
	make clean # stops and removes services

## Backups and Restoring

To backup, run `make backup` once you have set up your checks, tags etc in Uptime.

To restore, first copy a backup into backups/dump directory (one of the timestamped backups you have)....

Then run `make restore`
