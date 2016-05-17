FROM maven:3.3.9-jdk-8
MAINTAINER Benjamin Borbe <bborbe@rocketnews.de>

RUN set -x \
	&& mkdir /sources \
	&& git clone https://github.com/bborbe/bot_agent_java.git /sources/bot_agent_java \
	&& git clone https://github.com/bborbe/bot_agent_highrise.git /sources/bot_agent_highrise \
	&& cd /sources/bot_agent_java \
	&& mvn test install \
	&& cd /sources/bot_agent_highrise \
	&& mvn test install \
	&& cp /sources/bot_agent_highrise/target/bot-agent-jar-with-dependencies.jar /bot-agent.jar \
	&& rm -rf /sources

CMD ["java","-Xms150m","-Xmx200m","-jar","/bot-agent.jar"]
