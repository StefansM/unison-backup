#!/bin/bash
set -e

apt-get install unison dpkg-dev
apt-get build-dep unison
build_dir=$(readlink -e $(mktemp -d unison-build-XXXXXX))
trap "rm -r '$build_dir'" INT TERM EXIT

cd "$build_dir"
apt-get source unison

# Get extracted directory name
src_dir=$(find -maxdepth 1 -name 'unison*' -type d)
cd "$src_dir"

# Add unison-fsmonitor to install file
echo 'unison-fsmonitor /usr/bin' >> "debian/unison.install.in" 
# Build package
dpkg-buildpackage -b -uc -us
cd ..
dpkg -i unison_*.deb
