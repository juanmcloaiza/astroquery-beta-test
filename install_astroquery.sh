#!/usr/bin/env bash

rm -rf TEST_ESO_ASTROQUERY
mkdir TEST_ESO_ASTROQUERY
cd TEST_ESO_ASTROQUERY/

git clone https://github.com/juanmcloaiza/astroquery.git
cd astroquery
git checkout TAP
python -m pip install .
LAST_COMMIT=$(git log --oneline | head -1)
cd ..
clear

echo ""
echo " ##### "
echo ' If the line below reads "ESO TAP url: http://archive.eso.org/tap_obs", everything went ok'
python -c 'from astroquery.eso import Eso; print(f"ESO TAP url: {Eso()._tap_url()}")'
echo ""
echo " Last commit: $LAST_COMMIT"
echo " ##### "