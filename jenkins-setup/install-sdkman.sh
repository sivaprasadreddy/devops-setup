#!/usr/bin/env bash

USERNAME="siva"

#sudo su - ${USERNAME}
apt-get install -y zip unzip
export SDKMAN_DIR="/usr/local/sdkman" && curl -s "https://get.sdkman.io" | bash
sudo chmod -R a+w $SDKMAN_DIR
source "$SDKMAN_DIR/bin/sdkman-init.sh"


sdkman_bashrc="/home/${USERNAME}/.bashrc"
sdkman_init_snippet=$( cat << EOF
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$SDKMAN_DIR"
[[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"
EOF
)

echo -e "\n$sdkman_init_snippet" >> "$sdkman_bashrc"
echo "Added sdkman init snippet to $sdkman_bashrc"

sdk version
sdk install java 11.0.10-open
source "$sdkman_bashrc"