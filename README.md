gtstt
=====

gtstt (gThumb search tracker tags) - shell script to open images in gThumb based on [Gnome Tracker](https://wiki.gnome.org/Projects/Tracker) search results for embedded JPEG XMP tags

gtstt.sh is a shell script that will query the Tracker database (using SPARQL)
based on a comma separated list of tags and pass the resulting list of image
URLs to gThumb for viewing.

You can also supply a rating, a year or a maximum limit to the number of
results.

## BACKGROUND
Currently gThumb provides the ability to add XMP tags into image files, and
the Tracker database will index these tags (assuming you store the images in a
directory the tracker miner has been told to index!)

Unfortunately there didn't seem to be a convenient way to search for
images and view the results, based on the tags or ratings that had been applied to them:-
This is where this script fits in!

We simply fire a dynamically generated SPARQL query the Tracker database, retrieve list of file URIs to the relevant images, then pass the list to gThumb.

## USAGE
The script can take 4 options, you need to supply any or all of the -t, -y or -r options, but at least one of these:

`-t <comma separated tag list>` e.g. spanish.castle,welsh.castle,medieval

`-y year` - the year of image file creation e.g. 2011

`-l limit` - max number of results e.g. 50

`-r rating` - integer between 1 ... 10. Filters out images with a rating below
this value

Enjoy!
