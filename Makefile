################################################################################
# Makefile for deploying user interface code to a web server
#

# Configurable parameters
OSX_WEBSERVER_ROOT='/Library/WebServer/Documents/'
SERVICE_PATH='/generic'

gulp:
	cd UI_dev; gulp

configure_ui:
	sed 's%__SERVICE_PATH__%$(SERVICE_PATH)%' \
		generic/__index.html > generic/index.html
	sed 's%__SERVICE_PATH__%$(SERVICE_PATH)%' \
		generic/dist/__dist.js > generic/dist/___dist.js
	sed 's%__SERVICE_PATH__%$(SERVICE_PATH)%' \
		generic/dist/__dist.min.js > generic/dist/___dist.min.js

osx_deploy: gulp configure_ui
	cp -r generic $(OSX_WEBSERVER_ROOT)
