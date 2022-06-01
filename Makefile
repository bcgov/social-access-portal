-include .env

export $(shell sed 's/=.*//' .env)

export GIT_LOCAL_BRANCH?=$(shell git rev-parse --abbrev-ref HEAD)

export GIT_LOCAL_BRANCH := $(or $(GIT_LOCAL_BRANCH),dev)

# Keycloak
export KEYCLOAK_AUTHORITY := $(or $(KEYCLOAK_AUTHORITY),https://keycloak.freshworks.club/auth/realms/social-sector-portal-test)
export KEYCLOAK_CLIENT_ID := $(or $(KEYCLOAK_CLIENT_ID),social-sector-portal)

# Demo App 1
export APP_NAME_1 := $(or $(APP_NAME_1),Adopt BC)
export APP_TITLE_1 := $(or $(APP_TITLE_1),Generic Application Title 1)
export KEYCLOAK_REDIRECT_URI_1 := $(or $(KEYCLOAK_REDIRECT_URI_1),http://localhost:3000)

# Demo App 1
export APP_NAME_2 := $(or $(APP_NAME_2),My Self Serve)
export APP_TITLE_2 := $(or $(APP_TITLE_2),Generic Application Title 2)
export KEYCLOAK_REDIRECT_URI_2 := $(or $(KEYCLOAK_REDIRECT_URI),http://localhost:3001)

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

run-local-keycloak:
	@echo "+\n++ Make: Starting keycloak ...\n+"

	@docker-compose up keycloak

close-local:
	@echo "+\n++ Make: Stopping app ...\n+"
	@docker-compose down