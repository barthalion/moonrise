# README

Simple overlay created by Barthalion and mariom. Mostly bleeding edge, dangerous, experimental and unstable packages, that want to eat your cat. Be warned.

## How to use
### layman
    layman -o http://github.com/Barthalion/moonrise/raw/master/overlay.xml -f -a moonrise 

### Otherwise
1. ``git clone git://github.com/Barthalion/moonrise.git``
2. Add to ``/etc/make.conf``:
``PORTDIR_OVERLAY="/path/to/overlay"``
3. Edit ``/etc/portage/package.keywords`` and unmask desired packages
