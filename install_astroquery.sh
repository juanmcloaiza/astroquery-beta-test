#!/usr/bin/env bash

rm -rf TEST_ESO_ASTROQUERY
mkdir TEST_ESO_ASTROQUERY
cd TEST_ESO_ASTROQUERY/

git clone https://github.com/juanmcloaiza/astroquery.git
cd astroquery
git checkout colname-op-val
python -m pip install .
cd ..

echo ""
echo " ##### "
echo ""
echo ' If the line below reads "ESO TAP url: http://archive.eso.org/tap_obs", everything went ok'
python -c 'from astroquery.eso import Eso; print(f"ESO TAP url: {Eso()._tap_url()}")'
echo ""
echo " ##### "