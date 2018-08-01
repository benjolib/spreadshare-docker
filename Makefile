ROOT_DIR       := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))
VARIABLES_FILE  = $(ROOT_DIR)/variables.env
PHALCON_VERSION = $(shell docker run -it --rm phalconphp/php-apache:ubuntu-16.04 sh -c "/usr/bin/php -r 'echo Phalcon\Version::get();'")
SHELL          := $(shell which bash)
VERSION         = 1.0
ARGS            = $(filter-out $@,$(MAKECMDGOALS))

.SILENT: ;               # no need for @
.ONESHELL: ;             # recipes executed in same shell
.NOTPARALLEL: ;          # wait for this target to finish
.EXPORT_ALL_VARIABLES: ; # send all vars to shell
default: help-default;   # default target
Makefile: ;              # skip prerequisite discovery

.title:
	$(info Spreadshare Compose: $(VERSION))
	$(info )

help-default help: .title
	@echo "                          ====================================================================="
	@echo "                          Spreadshare Docker Image"
	@echo "                          "
	@echo "                          Help Menu"
	@echo "                          ====================================================================="
	@echo "                    help: Show Help Menu: type: make help"
	@echo "                   check: Check required files"
	@echo "                  status: List containers status"
	@echo "                 version: Show versions"
	@echo "                          ====================================================================="
	@echo "                          Main Menu"
	@echo "                          ====================================================================="
	@echo "                      up: Create and start application in detached mode (background)"
	@echo "                    pull: Pull latest dependencies"
	@echo "                    stop: Stop application"
	@echo "                   root:  Login to the 'app' container as 'root' user"
	@echo "                   shell: Login to the 'app' container as 'application' user"
	@echo "                   start: Start application"
	@echo "                   build: Build or rebuild services"
	@echo "                   reset: Reset all containers, delete all data, rebuild services and restart"
	@echo "              reset-prod: Same as reset but for production environment"
	@echo "           reset-staging: Same as reset but for staging environment"
	@echo "                 php-cli: Run PHP interactively (CLI)"
	@echo ""

build: check
	docker-compose build --no-cache

pull:
	docker pull mysql:5.7
	docker pull redis:4.0
	docker pull jeroenpeeters/docker-ssh:latest
	docker pull phalconphp/beanstalkd:1.10
	docker pull phalconphp/php-apache:ubuntu-16.04

up: check
	docker-compose up -d

up-prod: check
	docker-compose -f docker-compose.yml -f docker-compose.prod.yml up -d

up-staging: check
	docker-compose -f docker-compose.yml -f docker-compose.staging.yml up -d

start: check
	docker-compose start

stop:
	docker-compose stop 

status:
	docker-compose ps

reset: check stop clean build up

reset-prod: check stop clean build up-prod

reset-staging: check stop clean build up-staging

check:
ifeq ($(wildcard $(VARIABLES_FILE)),)
	$(error Failed to locate the $(VARIABLES_FILE) file.)
endif
	docker-compose config -q

version: .title
	$(info Phalcon $(PHALCON_VERSION))
	docker-compose version

php-cli:
	docker run -it --rm phalconphp/php-apache:ubuntu-16.04 sh -c "/usr/bin/php -a"

bash: shell

shell:
	docker exec -it -u application $$(docker-compose ps -q app) /bin/bash

root:
	docker exec -it -u root $$(docker-compose ps -q app) /bin/bash

clean: stop
	docker-compose down --remove-orphans

%:
	@:
