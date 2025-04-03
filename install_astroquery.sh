#!/usr/bin/env bash

mkdir TEST_ESO_ASTROQUERY
cd TEST_ESO_ASTROQUERY/

git clone https://github.com/juanmcloaiza/astroquery.git
cd astroquery
git checkout TAP
python -m pip install .
cd ..

echo ""
echo " ##### "
echo ""
python -c 'from astroquery.eso import Eso; print(f"ESO TAP url: {Eso()._tap_url()}")'
echo ""
echo ' If the line above reads "ESO TAP url: http://archive.eso.org/tap_obs", everything went ok'
echo ""
echo ""
echo " ##### "