# README

Simple overlay created by Barthalion and mariom. Mostly bleeding edge, dangerous, experimental and unstable packages, that want to eat your cat. Be warned.

## How to use
### layman
First emerge layman with git support, of course. Then:  
    layman -a moonrise

### Otherwise
1. ``git clone git://github.com/Barthalion/moonrise.git``
2. Add to ``/etc/make.conf``:
``PORTDIR_OVERLAY="/path/to/overlay"``
3. Edit ``/etc/portage/package.keywords`` and unmask desired packages

### Mirrors
There is also available [mirror](http://repo.or.cz/w/moonrise.git) hosted on [repo.or.cz](http://repo.or.cz/).  
Repository adress: ``git://repo.or.cz/moonrise.git``  
overlay.xml: ``http://repo.or.cz/w/moonrise.git/blob_plain/HEAD:/overlay.xml``  
