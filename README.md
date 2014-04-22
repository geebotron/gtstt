gtstt
=====

gtstt (gThumb search tracker tags) - shell script to open images in gThumb based on a tracker search results for XMP tags

gtstt.sh is a shell script that will query the tracker database (using SPARQL)
based on a comma separated list of tags and pass the resulting list of image
URLs to gThumb for viewing.

## BACKGROUND
Currently gThumb provides the ability to add XMP tags into image files, and
the tracker database will index these tags (assuming you store the images in a
directory the tracker miner has been told to index!)

Unfortunately but there didn't seem to be a convenient way to search for
images and view the results, based on the tags that had been applied to them:-
This is where this script fits in!

We simply query the tracker database, retrieve list of URLs to the relevant images then pass the list to gThumb

## USAGE
The script can take 3 options:

`-t <comma separated tag list>` e.g. spanish.castle,welsh.castle,medieval

`-y year` - the year of image file creation e.g. 2011

`-l limit` - max number of results e.g. 50

Enjoy!
