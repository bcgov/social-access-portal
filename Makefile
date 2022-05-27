-include .env

export $(shell sed 's/=.*//' .env)

export GIT_LOCAL_BRANCH?=$(shell git rev-parse --abbrev-ref HEAD)

export GIT_LOCAL_BRANCH := $(or $(GIT_LOCAL_BRANCH),dev)

# Keycloak
export KEYCLOAK_AUTHORITY := $(or $(KEYCLOAK_AUTHORITY),https://keycloak.freshworks.club/auth/realms/social-sector-portal-test)
export KEYCLOAK_CLIENT_ID := $(or $(KEYCLOAK_CLIENT_ID),social-sector-portal)

####################################################################
## Status Output
####################################################################

print-status:
	@echo " +---------------------------------------------------------+ "
	@echo " | Current Settings                                        | "
	@echo " +---------------------------------------------------------+ "
	@echo " | GIT LOCAL BRANCH: $(GIT_LOCAL_BRANCH) "
	@echo " +---------------------------------------------------------+ "

####################################################################
## Local Development
####################################################################

run-local:
	@echo "+\n++ Make: Starting keycloak ...\n+"

	@docker-compose up

close-local:
	@echo "+\n++ Make: Stopping app ...\n+"
	@docker-compose down