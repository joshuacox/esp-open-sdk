#!/bin/bash

TAG=joshuacox/esp-open-sdk
docker build -t $TAG .
docker run -it \
	-v `pwd`:/data \
	$TAG /bin/bash
	#$TAG make
