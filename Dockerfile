FROM node:10
LABEL maintainer="Dalibor Pancic <dalibor.pancic@oeaw.ac.at>"


RUN apt-get update && apt-get install -y vim git nano links wget curl openldap-utils
RUN cd /opt && \
    wget https://github.com/ether/etherpad-lite/archive/1.8.0.tar.gz  && \
    tar -xvzf 1.8.0.tar.gz && rm -f 1.8.0.tar.gz && \
    mv etherpad-lite-* etherpad-lite && \  
    cp /opt/etherpad-lite/settings.json.docker /opt/etherpad-lite/settings.json

RUN useradd --uid 5001 --create-home etherpad 

RUN chown -R etherpad:etherpad /opt/etherpad-lite 

USER etherpad:etherpad

WORKDIR /opt/etherpad-lite

# install node dependencies for Etherpad
RUN bin/installDeps.sh && \
        rm -rf ~/.npm/_cacache

# Install the plugins, if ETHERPAD_PLUGINS is not empty.
#
# Bash trick: in the for loop ${ETHERPAD_PLUGINS} is NOT quoted, in order to be
# able to split at spaces.
RUN for PLUGIN_NAME in "ep_mypads"; do npm install "${PLUGIN_NAME}"; done

EXPOSE 9001
CMD ["node", "node_modules/ep_etherpad-lite/node/server.js"]
