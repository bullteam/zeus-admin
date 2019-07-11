SHELL := /bin/bash
BASE_PATH := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

TITLE := $(shell basename $(BASE_PATH))
SHORT_REV := $(shell git rev-parse HEAD | cut -c1-8)
BUILD_TIME := $(shell date +%Y-%m-%d--%T)
APP_PKG := $(shell $(BASE_PATH)/scripts/apppkg.sh)
UI := $(BASE_PATH)/src/ui
TAG := $(shell $(BASE_PATH)/scripts/tag.sh)
export BIN_OUT := $(BASE_PATH)/bin

all: print

print:
	@echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>making print<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
	@echo SHELL:$(SHELL)
	@echo BASE_PATH:$(BASE_PATH)
	@echo TITLE:$(TITLE)
	@echo SHORT_REV:$(SHORT_REV)
	@echo APP_PKG:$(APP_PKG)
	@echo BIN_OUT:$(BIN_OUT)
	@echo USER:$(USER)
	@echo HUB:$(HUB)
	@echo UI:$(UI)
	@echo TAG:$(TAG)
	@echo -e "\n"
build:
	@echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>make build<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
	$(shell $(BASE_PATH)/scripts/build.sh)
	@echo -e "\n"
run:
	@echo ">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>run zeus<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
	$(shell $(BASE_PATH)/scripts/run.sh)
	@echo -e "\n"
