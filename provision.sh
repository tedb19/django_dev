#!/bin/bash

# update the packages/repositories. the y flag makes it run silently, with no prompts
echo "==============: updating the repos..."
sudo apt-get -y update > /dev/null

# setting the locale to US English, UTF-8.
# this sorts the 'dpkg-reconfigure: unable to re-open stdin: No file or directory'
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
locale-gen en_US.UTF-8
dpkg-reconfigure locales

# adding the '> /dev/null' at the end of each command suppresses the output from the installation processes. 
# If you would like to see the output when provisioning, simply remove it.
echo "Installing Git..."
sudo apt-get -y install git > /dev/null

# install tree for easily inspecting a directory structure in a tree-like structure
# see http://askubuntu.com/questions/431251/how-to-print-the-directory-tree-in-terminal for more details
echo "Installing tree..."
sudo apt-get -y install tree > /dev/null

# install pip
echo "==============: installing pip3..."
sudo apt-get -y install python3-pip > /dev/null

# installs xvfb, firefox, and chromium - everything you need for headless
# selenium testing
echo "==============: installing selenium dependencies..."
sudo apt-get -y install xvfb firefox chromium-browser > /dev/null

# install virtualenv
echo "==============: installing virtualenv..."
sudo pip3 install virtualenv > /dev/null

echo "==============: creating a virtualenv called ve @ /venvs/ and installing the requirements ..."
sudo -u root -i sh -c "mkdir /venvs; virtualenv /venvs/ve; /venvs/ve/bin/pip3 install -r /vagrant/requirements.txt"

# enable colorful terminal
# find '# force_color_prompt=yes' and replace with 'force_color_prompt=yes'
# in the ~/.bashrc file, globally
# see http://askubuntu.com/questions/20414/find-and-replace-text-within-a-file-using-commands 
echo "==============: enabling colorful terminal..."
sed -i 's/# force_color_prompt=yes/force_color_prompt=yes/g' ~/.bashrc
source ~/.bashrc

echo "==============: The system is now ready. "
echo "To activate the virtualenv, run:"
echo "    source /venvs/ve/bin/activate"