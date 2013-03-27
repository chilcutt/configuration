#!/bin/bash

# install bash completion
sudo port install bash-completion

# set default shell to use port installed bash
if [ -n "`grep '^/opt/local/bin/bash$' /etc/shells`" ]; then
  echo "/opt/local/bin/bash" | sudo tee -a /etc/shells
fi
chsh -s /opt/local/bin/bash

# change the root shell too
sudo chsh -s /opt/local/bin/bash
