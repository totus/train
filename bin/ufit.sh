#!/bin/bash

openapi_generator_install() {
    git clone https://github.com/OpenAPITools/openapi-generator /tmp/openapi-generator
    cd /tmp/openapi-generator
    git co release_4.0.2
    mvn clean install
}

openapi_generator_flask_server() {
    java -jar bin/openapi-generator-cli.jar generate -i openapi/model.json -g python-flask -o ufit_api_flask
}

if [ "$1" == "openapi" ]; then
    shift
    if [ "$1" == "generator" ]; then
        shift
        if [ "$1" == "install" ]; then
	    openapi_generator_install
    	elif [ "$1" == "js-client" ]; then
            echo js-client
    	elif [ "$1" == "flask" ]; then
	    openapi_generator_flask_server
	fi
    fi
# attach to container to ebable debugging
elif [ "$1" == "heroku" ]; then
    shift
    if [ "$1" == "deploy" ]; then
	echo "deploy-stub"
    fi
# Build base images
else
    echo "Help"
fi

