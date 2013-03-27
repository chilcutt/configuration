#!/bin/bash

# install janus
curl -Lo- https://bit.ly/janus-bootstrap | bash

# install vim tools
sudo port install p5-app-ack
sudo ln -s /opt/local/bin/ack-5.12 /opt/bin/ack
sudo port install ctags
