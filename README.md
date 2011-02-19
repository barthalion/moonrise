# README

Simple overlay created by Barthalion and mariom. Mostly bleeding edge, dangerous, experimental and unstable packages, that want to eat your cat. Be warned.
(Overlay is tempotary name, if you have an idea, contact with us.)

## How to use
### layman
    layman -o http://github.com/Barthalion/overlay/raw/master/overlay.xml -f -a overlay

### Otherwise
1. ``git clone git://github.com/Barthalion/overlay.git``
2. Add to ``/etc/make.conf``:
``PORTDIR_OVERLAY="/path/to/overlay"``
3. Edit ``/etc/portage/package.keywords`` and unmask desired packages