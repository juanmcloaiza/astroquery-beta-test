from astroquery.ipac.irsa import Irsa
from astropy.coordinates import SkyCoord
from astropy import units as u
from astropy.io import fits
from astropy.nddata import Cutout2D
from astropy.wcs import WCS
import matplotlib.pyplot as plt
coord = SkyCoord('150.01d 2.2d', frame='icrs')
spitzer_images = Irsa.query_sia(pos=(coord, 1 * u.arcmin), collection='spitzer_seip')
science_image = spitzer_images[spitzer_images['dataproduct_subtype'] == 'science'][0]
with fits.open(science_image['access_url'], use_fsspec=True) as hdul:
     cutout = Cutout2D(hdul[0].section, position=coord, size=2 *
u.arcmin, wcs=WCS(hdul[0].header))
plt.imshow(cutout.data, cmap='grey')
plt.show()