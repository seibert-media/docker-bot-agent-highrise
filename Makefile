default: build

clean:
	docker rmi bborbe/bot-agent-highrise

build:
	docker build --no-cache --rm=true -t quay.io/seibertmedia/bot-agent-highrise .

run:
	docker run -e NSQD_ADDRESS=localhost:4150 -e NSQ_LOOKUPD_ADDRESS=localhost:4161 quay.io/seibertmedia/bot-agent-highrise:latest

shell:
	docker run -i -t quay.io/seibertmedia/bot-agent-highrise:latest /bin/bash

upload:
	docker push quay.io/seibertmedia/bot-agent-highrise
