#!/bin/bash

# python
    # install python 3.x
if  ! which python3 >/dev/null
    then
        echo "Installing python3 ..."
        sudo add-apt-repository --yes ppa:deadsnakes/ppa
        sudo apt update
        sudo apt install -y --no-install-recommends python3.8
    fi
    # python -> python3 
if [[ ! $(python3 --version) == $(python --version) ]]
    then
        sudo update-alternatives --install /usr/bin/python python /usr/bin/python3 10
    fi
echo "INSTALLED: $(python --version)"

# youtube-dl
echo "Installing youtube-dl ..."
sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl
sudo chmod a+rx /usr/local/bin/youtube-dl
echo "INSTALLED: youtube-dl $(youtube-dl --version)"

# mpv
echo "installing mpv ..."
sudo add-apt-repository --yes ppa:mc3man/mpv-tests
sudo apt update
sudo apt install -y --no-install-recommends mpv
echo "INSTALLED: $(mpv --version | grep -o '^mpv\ [0-9.]*')"
